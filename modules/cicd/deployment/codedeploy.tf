# create a CodeDeploy application
resource "aws_codedeploy_app" "wp_app" {
  name = "${var.app}-${terraform.workspace}"
  tags = var.tags
}

# create a deployment group
resource "aws_codedeploy_deployment_group" "wp_instances" {
  app_name               = aws_codedeploy_app.wp_app.name
  deployment_group_name  = "${var.app}-${terraform.workspace}-group"
  service_role_arn       = aws_iam_role.codedeploy.arn
  tags                   = var.tags
  deployment_config_name = "CodeDeployDefault.OneAtATime" # AWS defined deployment config

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = format("%s-%s", var.app, terraform.workspace)
    }
  }

  # trigger a rollback on deployment failure event
  auto_rollback_configuration {
    enabled = true
    events = [
      "DEPLOYMENT_FAILURE",
    ]
  }
}
