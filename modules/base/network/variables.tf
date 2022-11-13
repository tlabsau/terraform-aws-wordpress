variable "app" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to apply to resources"
}

variable "cidr_base" {
  type        = string
  description = "The first 3 digits of the VPC CIDR (e.g. 10.0.0)"
}
