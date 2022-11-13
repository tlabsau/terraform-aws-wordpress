# Name of the application. This value should usually match the application tag below.
variable "app" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to apply to resources"
}

variable "db_public_access" {
  type        = bool
  description = "Flag to set if need the wordpress database to be publicly accessible"
}

variable "cidr_base" {
  type        = string
  description = "The first 3 parts of the VPC CIDR (e.g. 10.0.0)"
}

variable "db_username" {
  type        = string
  description = "Master username of the db"
}

variable "db_name" {
  type        = string
  description = "Wordpress database name"
}

variable "wp_username" {
  type        = string
  description = "Wordpress username"
}

variable "site_domain" {
  type        = string
  description = "The primary domain name of the website"
}
