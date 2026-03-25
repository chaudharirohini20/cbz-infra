# Create an S3 bucket
resource "aws_s3_bucket" "infra_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "StaticWebsiteBucket"
    Environment = var.environment
  }
}

# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "infra_bucket_website" {
  bucket = aws_s3_bucket.infra_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Disable Block Public Access
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.infra_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Set the bucket policy to allow public read access (use cautiously)
resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.infra_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.infra_bucket.arn}/*"
      }
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.example]
}

# Output the bucket's website endpoint
output "website_domain" {
  value       = aws_s3_bucket_website_configuration.infra_bucket_website.website_domain
  description = "The URL to access the static website"
}