environment = "dev"
aws_region = "us-east-2"

# RDS Variables
rds_instance_class        = "db.t3.micro"
rds_allocated_storage     = 20
rds_username             = "admin"
rds_password             = "DevPassword123"  # Change this in production
rds_db_name              = "studentdb"

# EKS Variables
eks_project            = "radison-hms"
eks_desired_nodes      = 2
eks_max_nodes          = 2
eks_min_nodes          = 2
eks_node_instance_type = "t3.medium"

# S3 Variables
s3_bucket_name = "radison-hms-frontend"
s3_environment = "dev" 