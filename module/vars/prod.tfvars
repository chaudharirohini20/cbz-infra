
  environmenvironment = "prod"
  aws_region = "eu-north-1"

# RDS Variables
  instance_class        = "db.t3.medium"
  allocated_storage     = 100
  username             = "admin"
  password             = "ProdPassword123"  # Change this in production
  db_name              = "studentdb"

# EKS Variables
  eks_project            = "cbz"
  eks_desired_nodes      = 4
  eks_max_nodes          = 8
  eks_min_nodes          = 3
  eks_node_instance_type = "t3.xlarge"

# S3 Variables
  s3_bucket_name = "cbz-frontend-prod-bucket"
  s3_environment = "prod" 
