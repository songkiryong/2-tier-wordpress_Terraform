resource "aws_lb" "alb" {
  name               = "${var.vpc_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = aws_subnet.public.*.id

  tags = {
    Name = "${var.vpc_name}-alb"
    Environment = "development"
  }
}

resource "aws_lb_target_group" "alb_target" {
  name     = "${var.vpc_name}-alb-target-group"
  port     = 80                                 
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  slow_start = 30
}

resource "aws_lb_target_group_attachment" "alb_target_attach" {
  count = length(var.availability_zones) # 2
  target_group_arn = aws_lb_target_group.alb_target.arn
  target_id        = element(aws_instance.web.*.id, count.index)
  port             = 80
}

resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target.arn
  }
}

data "aws_acm_certificate" "www_kiryong_shop"   { 
  domain   = "www.kiryong.shop"
  statuses = ["ISSUED"]
}
resource "aws_alb_listener" "https" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${data.aws_acm_certificate.www_kiryong_shop.arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.alb_target.arn}"
    type             = "forward"
  }
}

data "aws_route53_zone" "shop" {
  name = "kiryong.shop"
}

resource "aws_route53_record" "frontend" {
  zone_id = "${data.aws_route53_zone.shop.zone_id}"
  name    = "www"
  type    = "A"

  alias {
    name     = "${aws_lb.alb.dns_name}"
    zone_id  = "${aws_lb.alb.zone_id}"
    evaluate_target_health = true
  }
}
