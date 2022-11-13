variable "app" {
  type        = string
  description = "Name of the application"
}

variable "site_domain" {
  type        = string
  description = "The primary domain name of the website"
}

variable "repository_id" {
  type        = string
  description = "The ID for source code repository"
}

variable "connection_arn" {
  type        = string
  description = "Connection ARN to connect Codepipeline to source code repository"
}

variable "ami_name" {
  type        = string
  description = "AMI Image name"
  default     = ""
}
