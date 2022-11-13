output "db_endpoint" {
  description = "The database endpoint, can be used to connect to the database"
  value       = module.wp_database.db_instance_endpoint
}

output "db_sec_group_id" {
  description = "The security group id for database"
  value       = aws_security_group.db.id
}
