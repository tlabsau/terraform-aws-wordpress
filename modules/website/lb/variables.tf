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

variable "ec2_sec_group_id" {
  type        = string
  description = "Security Group ID for the EC2 instance (Wordpress server)"
}

variable "ec2_instance_id" {
  type        = string
  description = "Wordpress server instance ID"
}

variable "site_domain" {
  type        = string
  description = "The primary domain name of the website"
}

variable "certificate_domain" {
  type        = string
  description = "The primary domain name of the certificate in ACM"
}
