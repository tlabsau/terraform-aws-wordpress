output "db_password" {
  description = "The database password"
  value       = random_password.db_password.result
  sensitive   = true
}
