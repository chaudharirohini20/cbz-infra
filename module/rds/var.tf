variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
}
variable "db_name" {
  description = "RDS database name"
  type        = string
}

variable "username" {
  description = "RDS master username"
  type        = string
}

variable "password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment name"
  type        = string
} 