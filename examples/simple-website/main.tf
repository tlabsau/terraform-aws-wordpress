provider "aws" {
  region = "ap-southeast-2"
}

module "wordpress" {
  source             = "../../"
  app                = var.app
  key_name           = var.app
  site_domain        = var.site_domain
  certificate_domain = var.site_domain
  repository_id      = var.repository_id
  connection_arn     = var.connection_arn
  ami_name           = var.ami_name
}
