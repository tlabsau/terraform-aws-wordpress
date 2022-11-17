module "server" {
  source            = "./server"
  app               = var.app
  tags              = var.tags
  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  db_sec_group_id   = var.db_sec_group_id
  key_name          = var.key_name
  ami_name          = var.ami_name
}

module "load_balancer" {
  source             = "./lb"
  app                = var.app
  tags               = var.tags
  vpc_id             = var.vpc_id
  public_subnet_ids  = var.public_subnet_ids
  ec2_sec_group_id   = module.server.sec_group_id
  ec2_instance_id    = module.server.instance_id
  certificate_domain = var.certificate_domain
  depends_on = [
    module.server
  ]
}

module "dns" {
  source      = "./dns"
  site_domain = var.site_domain
  lb_dns_name = module.load_balancer.dns_name
  lb_zone_id  = module.load_balancer.zone_id
  depends_on = [
    module.load_balancer
  ]
}

module "firewall" {
  count  = var.waf_enabled == true ? 1 : 0
  source = "./waf"
  app    = var.app
  tags   = var.tags
  lb_arn = module.load_balancer.arn
  depends_on = [
    module.load_balancer
  ]
}
