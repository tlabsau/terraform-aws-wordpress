output "app_files_bucket" {
  description = "The website bucket to store the premium plugins and wordpress files"
  value       = module.app-bucket.bucket_name
}

output "bucket_arn" {
  description = "The ARN for website bucket that stores the premium plugins and wordpress files"
  value       = module.app-bucket.bucket_arn
}

output "vpc_id" {
  description = "VPC ID for the network"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  value       = module.network.public_subnet_ids
  description = "VPC - Public Subnet ID"
}

output "db_endpoint" {
  description = "The database endpoint, can be used to connect to the database"
  value       = module.database.db_endpoint
}

output "db_sec_group_id" {
  description = "The security group for the database"
  value       = module.database.db_sec_group_id
}
