locals {
  tags = merge({
    Name        = format("%s-%s", var.app, terraform.workspace)
    Application = var.app
    Environment = terraform.workspace
  }, var.tags)

  cidr_base = format("10.0.%s", index(var.environments, terraform.workspace))

  branch_name = lookup(var.env_branch, terraform.workspace, "develop")
}
