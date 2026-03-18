provider "aws" {
     region = "eu-west-3"
     }
 
 resource "aws_instance" "my-instance" {
    ami = "ami-007dcf089b8078f1a"
    instance_type ="t3.micro"
    vpc_security_group_ids =["sg-0ad7b8699e7476134"]
    key_name ="rohi12"
    tags ={
        name ="my-instance"
        env ="dev"

    }
   }