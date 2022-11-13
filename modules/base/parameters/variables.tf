variable "app" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to apply to resources"
}

variable "site_domain" {
  type        = string
  description = "The primary domain name of the website"
}

variable "db_name" {
  type        = string
  description = "Wordpress database name"
}

variable "db_username" {
  type        = string
  description = "Master username of the db"
}

variable "wp_username" {
  type        = string
  description = "Wordpress username"
  default     = "wpadmin"
  sensitive   = true
}
