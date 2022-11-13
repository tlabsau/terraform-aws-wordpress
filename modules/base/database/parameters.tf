resource "aws_ssm_parameter" "database_endpoint" {
  name      = "/${var.app}/${terraform.workspace}/wordpress_db_host"
  type      = "String"
  value     = module.wp_database.db_instance_endpoint
  overwrite = true

  depends_on = [
    module.wp_database
  ]
}
