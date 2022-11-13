variable "app" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to apply to resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the network"
}

variable "db_subnet_group_name" {
  type        = string
  description = "VPC subnet group name for the database"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "VPC - Public Subnet ID"
}

variable "db_name" {
  type        = string
  description = "Wordpress database name"
}

variable "db_username" {
  type        = string
  description = "Master username of the db"
}

variable "db_password" {
  type        = string
  description = "The admin password for the database"
}

variable "db_backup_retention_days" {
  type        = number
  description = "Number of days to retain db backups, Needed to enable backup"
  default     = 7
}

variable "db_backup_window" {
  type        = string
  description = "The daily time range during which automated backups for rds are created. Time in UTC."
  default     = "13:00-15:00" # 00:00 - 02:00 AU time
}

variable "db_maintenance_window" {
  type        = string
  description = "The daily time range during which maintance for rds are started. Time in UTC."
  default     = "Sat:15:00-Sat:17:00" # Sunday 02:00 - 04:00 AU time
}

variable "db_capacity" {
  type        = number
  description = "The Aurora capacity unit of the db."
  default     = 20
}

variable "db_instance_class" {
  type        = string
  description = "The database db instance class"
  default     = "db.t3.micro"
}

variable "db_public_access" {
  type        = bool
  description = "Flag to set if the database publicly accessible"
}
