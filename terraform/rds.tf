resource "aws_db_instance" "my_db" {
  identifier = "${var.mysql_db}"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "${var.mysql_db}"
  username             = "${var.mysql_user}"
  password             = "${var.mysql_password}"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.id

  multi_az = true
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_sg"
  subnet_ids = aws_subnet.db_private.*.id
  tags = {
    Name = "${var.vpc_name}_rds_sg"
  }
}
