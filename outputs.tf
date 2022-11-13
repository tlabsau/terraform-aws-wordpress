output "app_files_bucket" {
  description = "The website bucket to store the premium plugins and wordpress files"
  value       = module.base.app_files_bucket
}

output "db_endpoint" {
  description = "The database endpoint, can be used to connect to the database"
  value       = module.base.db_endpoint
}
