provider "aws" {
    region = "eu-west-1"
    shared_credentials_file = "~/.aws/credentials"
}

module "my-vpc" {
    source = "./VPC"
}

module "my-ec2" {
    source = "./EC2"
    vpc-id = module.my-vpc.vpcid
    subnet_a_id = module.my-vpc.subnetid
}

module "my-RDS" {
    source = "./RDS"
    private_subnet_id = module.my-vpc.subnet_id_private
    private_subnet_2_id = module.my-vpc.subnet_id_private_2
}