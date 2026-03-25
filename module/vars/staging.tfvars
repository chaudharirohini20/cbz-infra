environment = "staging"
aws_region = "us-east-2"

# RDS Variables
rds_instance_class        = "db.t4g.micro"
rds_allocated_storage     = 50
rds_username             = "admin"
rds_password             = "StagingPassword123"  # Change this in production
rds_db_name              = "studentdb"

# EKS Variables
eks_project            = "infra"
eks_desired_nodes      = 2
eks_max_nodes          = 5
eks_min_nodes          = 2
eks_node_instance_type = "t3.small"

# S3 Variables
s3_bucket_name = "infra-easycrud-b48"
s3_environment = "staging" 