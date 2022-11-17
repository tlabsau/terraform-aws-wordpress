resource "aws_s3_bucket" "app_files" {
  bucket        = "${var.app}-${terraform.workspace}-app-files"
  tags          = var.tags
  force_destroy = true
}

# Block S3 public access
resource "aws_s3_bucket_public_access_block" "app_files_block" {
  bucket = aws_s3_bucket.app_files.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "app_files_acl" {
  bucket = aws_s3_bucket.app_files.id
  acl    = "private"
}

# Enable objects versioning
resource "aws_s3_bucket_versioning" "app_files_versioning" {
  bucket = aws_s3_bucket.app_files.id
  versioning_configuration {
    status = "Enabled"
  }
}

# enable SSE-S3 encryption in the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "app_files_encryption" {
  bucket = aws_s3_bucket.app_files.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
