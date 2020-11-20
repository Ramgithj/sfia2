output "public-ipv4" {
    value = aws_instance.ec2.public_ip
}
