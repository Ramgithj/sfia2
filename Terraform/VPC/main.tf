resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = true
    tags = {
        Name = "VPC-created-by-terraform"
    }
}

resource "aws_subnet" "subnet_a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "eu-west-1a"
    tags = {
        Name = "public-subnet-tf"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id =aws_vpc.vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-1a"
    tags = {
        Name = "private-subnet-tf"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id =aws_vpc.vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "eu-west-1b"
    tags = {
        Name = "private-subnet-2-tf"
    }
}



resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = var.open_internet
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "rt_association" {
    subnet_id = aws_subnet.subnet_a.id
    route_table_id = aws_route_table.rt.id
}