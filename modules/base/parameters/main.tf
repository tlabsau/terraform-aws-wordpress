resource "random_password" "wp_password" {
  length  = 20
  special = false
}

resource "random_password" "db_password" {
  length  = 20
  special = false
}

locals {
  site_domain           = var.site_domain
  wordpress_username    = var.wp_username
  wordpress_password    = random_password.wp_password.result
  database_name         = var.db_name
  database_username     = var.db_username
  database_password     = random_password.db_password.result
  database_table_prefix = "wp_"
}

resource "aws_ssm_parameter" "site_domain" {
  name      = "/${var.app}/${terraform.workspace}/site_domain"
  type      = "String"
  value     = local.site_domain
  overwrite = true
  tags      = var.tags
}

resource "aws_ssm_parameter" "wordpress_username" {
  name      = "/${var.app}/${terraform.workspace}/wordpress_username"
  type      = "String"
  value     = local.wordpress_username
  overwrite = true
  tags      = var.tags
}

resource "aws_ssm_parameter" "wordpress_password" {
  name      = "/${var.app}/${terraform.workspace}/wordpress_password"
  type      = "SecureString"
  value     = local.wordpress_password
  overwrite = true
  tags      = var.tags
}

resource "aws_ssm_parameter" "database_name" {
  name      = "/${var.app}/${terraform.workspace}/wordpress_db_name"
  type      = "String"
  value     = local.database_name
  overwrite = true
  tags      = var.tags
}

resource "aws_ssm_parameter" "database_username" {
  name      = "/${var.app}/${terraform.workspace}/wordpress_db_user"
  type      = "String"
  value     = local.database_username
  overwrite = true
  tags      = var.tags
}

resource "aws_ssm_parameter" "database_password" {
  name      = "/${var.app}/${terraform.workspace}/wordpress_db_password"
  type      = "SecureString"
  value     = local.database_password
  overwrite = true
  tags      = var.tags
}

resource "aws_ssm_parameter" "database_table_prefix" {
  name      = "/${var.app}/${terraform.workspace}/wordpress_table_prefix"
  type      = "String"
  value     = local.database_table_prefix
  overwrite = true
  tags      = var.tags
}
