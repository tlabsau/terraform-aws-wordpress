module "base" {
  source           = "./modules/base"
  app              = var.app
  tags             = local.tags
  db_public_access = var.db_public_access
  cidr_base        = local.cidr_base
  site_domain      = var.site_domain
  wp_username      = var.wp_username
  db_username      = var.db_username
  db_name          = var.db_name
}

module "website" {
  source             = "./modules/website"
  app                = var.app
  tags               = local.tags
  key_name           = var.key_name
  site_domain        = var.site_domain
  certificate_domain = var.certificate_domain
  vpc_id             = module.base.vpc_id
  public_subnet_ids  = module.base.public_subnet_ids
  db_sec_group_id    = module.base.db_sec_group_id
  waf_enabled        = var.waf_enabled
  ami_name           = var.ami_name
  depends_on = [
    module.base
  ]
}

module "cicd" {
  source                = "./modules/cicd"
  app                   = var.app
  tags                  = local.tags
  app_files_bucket_name = module.base.app_files_bucket
  repository_id         = var.repository_id
  connection_arn        = var.connection_arn
  branch_name           = local.branch_name
  depends_on = [
    module.website
  ]
}
