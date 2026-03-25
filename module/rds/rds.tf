data "aws_vpc" "default" {
    default = true
}

data "aws_subnets" "default" {
    filter {
        name   = "vpc-id"
        values = [data.aws_vpc.default.id]
    }
}

data "aws_subnet" "name" {
        id = data.aws_subnets.default.ids[0]
}


resource "aws_db_instance" "student_rds" {
    allocated_storage    = var.allocated_storage
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "8.4.7"
    instance_class       = "db.t3.micro"
    db_name              = var.db_name
    username             = var.username
    password             = var.password
    vpc_security_group_ids = [aws_security_group.rds_sg.id]

    timeouts {
      create = "3h"
      delete = "3h"
      update = "3h"
    }

    tags = {
    Name        = "student_rds"
    Environment = var.environment
  }
  
}

resource "aws_security_group" "rds_sg" {
    name        = "rds_sg"
    description = "Security group for RDS instance"
    vpc_id      = data.aws_vpc.default.id

    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name        = "rds_sg"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "default" {
    name       = "default-db-subnet-group-${var.environment}"
    subnet_ids = data.aws_subnets.default.ids
    tags = {
    Name        = "rds_subnet_group"
    Environment = var.environment
  }
  
}