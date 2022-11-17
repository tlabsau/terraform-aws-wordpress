# Name of the application. This value should usually match the application tag below.
variable "app" {
  type        = string
  description = "Name of the application"
}

# A map of the extra tags to apply to aws resources.
# there is already list of tags will be added by default, please
# check locals "tags"
variable "tags" {
  description = "AWS Tags to add to all resources created (where possible)"
  type        = map(string)
  default     = {}
}

variable "env_branch" {
  type        = map(any)
  description = "Map to link environment to the repo branch"
  default = {
    "develop" = "develop",
    "prod"    = "main"
  }
}

variable "db_public_access" {
  type        = bool
  description = "Flag to set if the database publicly accessible"
  default     = false
}

variable "key_name" {
  type        = string
  description = "Pair key name to access resources"
  default     = ""
}

variable "site_domain" {
  type        = string
  description = "The primary domain name of the website"
}

variable "certificate_domain" {
  type        = string
  description = "The primary domain name of the certificate in ACM"
  default     = ""
}

variable "waf_enabled" {
  description = "Flag to determine if WAF needed for the website"
  type        = bool
  default     = false
}

variable "environments" {
  type        = list(string)
  description = "List of all environments for the app"
  default     = ["default", "develop", "prod"]
}

variable "wp_username" {
  type        = string
  description = "Wordpress username"
  default     = "wpadmin"
}

variable "db_username" {
  type        = string
  description = "Master username of the db"
  default     = "dbadmin"
}

variable "db_name" {
  type        = string
  description = "Wordpress database name"
  default     = "wordpress"
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
