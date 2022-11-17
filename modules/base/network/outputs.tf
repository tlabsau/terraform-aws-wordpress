output "vpc_id" {
  description = "VPC ID for the network"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "VPC - Public Subnet ID"
  value       = module.vpc.public_subnets
}

output "db_subnet_group_name" {
  description = "VPC subnet group name for the database"
  value       = module.vpc.database_subnet_group_name
}
