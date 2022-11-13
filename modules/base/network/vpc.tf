data "aws_region" "current" {}

locals {
  region_name = data.aws_region.current.name
  network_setting = {
    "availability_zones"  = ["${local.region_name}a", "${local.region_name}b"],
    "vpc_cidr"            = "${var.cidr_base}.0/24",
    "private_subnet_cidr" = ["${var.cidr_base}.0/27", "${var.cidr_base}.32/27"],
    "public_subnet_cidr"  = ["${var.cidr_base}.64/27", "${var.cidr_base}.96/27"],
    "db_subnet_cidr"      = ["${var.cidr_base}.128/27", "${var.cidr_base}.160/27"]
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.app}-${terraform.workspace}-vpc"

  cidr             = local.network_setting.vpc_cidr
  azs              = local.network_setting.availability_zones
  private_subnets  = local.network_setting.private_subnet_cidr
  public_subnets   = local.network_setting.public_subnet_cidr
  database_subnets = local.network_setting.db_subnet_cidr

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  create_igw         = true
  enable_nat_gateway = false
  enable_vpn_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.tags
}
