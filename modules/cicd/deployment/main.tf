resource "aws_codepipeline" "wp_pipeline" {
  name     = "${var.app}-${terraform.workspace}-pipeline"
  role_arn = aws_iam_role.codepipeline.arn
  tags     = var.tags

  artifact_store {
    location = var.app_files_bucket_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]
      namespace        = "SourceVariables"

      configuration = {
        # Connection to github already added to AWS manually
        ConnectionArn    = var.connection_arn
        FullRepositoryId = var.repository_id
        BranchName       = var.branch_name
        DetectChanges    = false
      }
    }
  }
  stage {
    name = "Deploy"

    action {
      name      = "Deploy"
      category  = "Deploy"
      owner     = "AWS"
      provider  = "CodeDeploy"
      version   = "1"
      run_order = 1

      configuration = {
        "ApplicationName"     = aws_codedeploy_app.wp_app.name
        "DeploymentGroupName" = aws_codedeploy_deployment_group.wp_instances.deployment_group_name
      }
      input_artifacts = [
        "source_output",
      ]
      output_artifacts = []
    }
  }
}
