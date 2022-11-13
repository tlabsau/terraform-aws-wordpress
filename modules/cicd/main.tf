module "deployment" {
  source                = "./deployment"
  app                   = var.app
  tags                  = var.tags
  repository_id         = var.repository_id
  app_files_bucket_name = var.app_files_bucket_name
  connection_arn        = var.connection_arn
  branch_name           = var.branch_name
}
