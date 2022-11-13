# Get the HTPPS certificate for the website
data "aws_acm_certificate" "certificate" {
  count       = var.certificate_domain == "" ? 0 : 1
  domain      = var.certificate_domain
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "${var.app}-${terraform.workspace}-alb"

  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnet_ids
  security_groups = [var.ec2_sec_group_id]

  target_groups = [
    {
      name_prefix      = "wp-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        ec2_wp_target = {
          target_id = var.ec2_instance_id
          port      = 80
        }
      }
    }
  ]

  https_listeners = var.certificate_domain == "" ? [] : [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.aws_acm_certificate.certificate[0].arn
      target_group_index = 0
    }
  ]

  # Redirect HTTP to HTTPS
  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  tags = var.tags
}
