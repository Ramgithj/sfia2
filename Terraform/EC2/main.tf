resource "aws_security_group" "web_sg" {
  name        = var.name
  description = "Allow SSH connection"
  vpc_id      = var.vpc-id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = [var.open-internet]
    }
  }

  egress {
    from_port   = var.outbound-port
    protocol    = "-1"
    to_port     = var.outbound-port
    cidr_blocks = [var.open-internet]
  }

}



resource "aws_instance" "ec2" {
  ami                    = var.ubuntu-ami
  instance_type          = var.instance-type
  key_name               = var.pem-key
  subnet_id              = var.subnet_a_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = var.associate_public_ip_address
  tags = {
      Name = "created-by-terraform"
  }

}