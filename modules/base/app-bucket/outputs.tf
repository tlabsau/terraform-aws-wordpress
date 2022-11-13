output "bucket_name" {
  description = "The website bucket to store the premium plugins and wordpress files"
  value       = aws_s3_bucket.app_files.bucket
}

output "bucket_arn" {
  description = "The ARN for website bucket that stores the premium plugins and wordpress files"
  value       = aws_s3_bucket.app_files.arn
}
