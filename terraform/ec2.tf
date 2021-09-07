resource "aws_instance" "web" {
  count = length(var.availability_zones)
  ami = var.aws_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id = aws_subnet.public[count.index].id
  key_name = var.key_pair


  tags = {
    Name = "WEB-${count.index}"
  }
}

# Keypair for creating ec2
resource "aws_key_pair" "ssh" {
  key_name = "${var.key_pair}"
  public_key = var.public_key
}
