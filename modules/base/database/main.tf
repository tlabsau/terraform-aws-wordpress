module "wp_database" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.6.0"

  identifier        = "${var.app}-${terraform.workspace}"
  engine            = "mysql"
  engine_version    = "8.0.28"
  instance_class    = var.db_instance_class
  allocated_storage = var.db_capacity

  family                      = "mysql8.0"
  major_engine_version        = "8.0"
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true

  create_random_password = false
  db_name                = var.db_name
  port                   = "3306"
  username               = var.db_username
  password               = var.db_password

  db_subnet_group_name = var.db_subnet_group_name

  subnet_ids             = var.public_subnet_ids
  vpc_security_group_ids = [aws_security_group.db.id]
  publicly_accessible    = var.db_public_access

  skip_final_snapshot                 = true
  backup_retention_period             = var.db_backup_retention_days
  backup_window                       = var.db_backup_window
  maintenance_window                  = var.db_maintenance_window
  iam_database_authentication_enabled = true

  tags = var.tags
}
