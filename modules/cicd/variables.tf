# Name of the application. This value should usually match the application tag below.
variable "app" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to apply to resources"
}

variable "app_files_bucket_name" {
  type        = string
  description = "The name for website bucket to store pipeline artifactory files"
}

variable "repository_id" {
  type        = string
  description = "The ID for source code repository"
}

variable "connection_arn" {
  type        = string
  description = "Connection ARN to connect Codepipeline to source code repository"
}

variable "branch_name" {
  type        = string
  description = "The branch name to pull the source code from it"
}
