variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22]
}

variable "name" {
    default = "SG"
}

variable "open-internet" {
  default = "0.0.0.0/0"
}

variable "outbound-port" {
  description = "Port open to allow outbound connection"
  default     = 0
}

variable "ubuntu-ami" {
    default = "ami-0dc8d444ee2a42d8a"
}

variable "instance-type" {
    default = "t2.micro"
}

variable "pem-key" {
    default = "VMkey"
}

variable "vpc-id" {

}

variable "subnet_a_id" {

}


variable "associate_public_ip_address" {
    default = true
}
