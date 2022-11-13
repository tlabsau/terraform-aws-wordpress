variable "app" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to apply to resources"
}

variable "lb_arn" {
  type        = string
  description = "The ARN of the load balancer"
}
