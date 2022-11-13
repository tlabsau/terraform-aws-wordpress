variable "app" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to apply to resources"
}

variable "ami_name" {
  type        = string
  description = "AMI Image name"
}

variable "key_name" {
  type        = string
  description = "Pair key name to access resources"
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
  description = "Security Group ID for the database"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type for the wordpress server"
}
