variable "cidr_block" {}

variable "vpc_name" {
  default = "my_vpc"
}

variable "project" { 
    default = "my_project"
}

    variable "public_subnet_cidr" {
  default = "10.10.1.0/24"
}

  variable "availability_zone" {
  default = "eu-west-3"
}

variable "cidr_block" {
  default = "10.10.0.0/16"
}