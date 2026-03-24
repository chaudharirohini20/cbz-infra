provider "aws" {
  region = "eu-west-3"
}

module "vpc" {
  source = "./module/vpc"
  cidr_block = "10.10.0.0/16"
  project = "my-project"
}

module "rds" {
  source = "./module/rds"
  db_name = "titan_db"
  username = "rohini"
  password = "redhat"
  vpc_id = module.vpc.vpc_id
  private_db_subnet_id = module.vpc.private_db_subnet
  depends_on = [ module.vpc ]
}