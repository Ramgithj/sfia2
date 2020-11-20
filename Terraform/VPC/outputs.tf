output "vpcid" {
    value = aws_vpc.vpc.id
}

output "subnetid" {
    value = aws_subnet.subnet_a.id
}

output "subnet_id_private" {
    value = aws_subnet.private_subnet.id
}

output "subnet_id_private_2" {
    value = aws_subnet.private_subnet_2.id
}