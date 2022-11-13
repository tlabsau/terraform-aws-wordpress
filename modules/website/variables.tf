# Name of the application. This value should usually match the application tag below.
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

variable "public_subnet_ids" {
  type        = list(string)
  description = "VPC - Public Subnet ID"
}

variable "db_sec_group_id" {
  type        = string
  description = "The security group for the database"
}

variable "key_name" {
  type        = string
  description = "Pair key name to access resources"
}

variable "site_domain" {
  type        = string
  description = "The primary domain name of the website"
}

variable "waf_enabled" {
  type        = bool
  description = "Flag to determine if WAF needed for the website"
}

variable "certificate_domain" {
  type        = string
  description = "The primary domain name of the certificate in ACM"
}

variable "ami_name" {
  type        = string
  description = "AMI Image name"
}
