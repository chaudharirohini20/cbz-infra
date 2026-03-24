resource "aws_vpc" "my_vpc" {
  cidr_block = "var.cidr_block"
  instance_tenancy= "default"

  tags = { 
    name ="${var.project}-vpc"
  }
}  


resource "aws_subnet" "public_subnet" {
vpc_id = aws_vpc.my_vpc.id
cidr_block ="var.subnet_public_subnet_cidr_block"
availability_zone ="var.availability_zone"
tags ={
    name = "${var.project}-subnet"
}
depends_on =[aws_vpc.my_vpc]
}
