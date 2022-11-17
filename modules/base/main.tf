module "app_bucket" {
  source = "./app-bucket"
  app    = var.app
  tags   = var.tags
}

module "network" {
  source    = "./network"
  app       = var.app
  tags      = var.tags
  cidr_base = var.cidr_base
}

module "parameters" {
  source      = "./parameters"
  app         = var.app
  tags        = var.tags
  site_domain = var.site_domain
  wp_username = var.wp_username
  db_name     = var.db_name
  db_username = var.db_username
}

module "database" {
  source               = "./database"
  app                  = var.app
  tags                 = var.tags
  db_public_access     = var.db_public_access
  vpc_id               = module.network.vpc_id
  public_subnet_ids    = module.network.public_subnet_ids
  db_subnet_group_name = module.network.db_subnet_group_name
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = module.parameters.db_password

  depends_on = [
    module.network,
    module.parameters
  ]
}
