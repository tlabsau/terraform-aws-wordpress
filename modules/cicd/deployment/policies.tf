data "aws_iam_policy_document" "codedeploy_policy" {
  # create a service role for ec2
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codepipeline_policy" {
  # create a service role for ec2
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "codepipeline.amazonaws.com",
      "codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codedeploy" {
  name               = "${var.app}-${terraform.workspace}-codedeploy-role"
  assume_role_policy = data.aws_iam_policy_document.codedeploy_policy.json
  tags               = var.tags
}

# attach AWS managed policy called AWSCodeDeployRole
# required for deployments which are to an EC2 compute platform
resource "aws_iam_role_policy_attachment" "codedeploy_service" {
  role       = aws_iam_role.codedeploy.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

resource "aws_iam_role" "codepipeline" {
  name               = "${var.app}-${terraform.workspace}-codepipeline-role"
  tags               = var.tags
  assume_role_policy = data.aws_iam_policy_document.codepipeline_policy.json

  inline_policy {
    name = "codepipeline-policies"
    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "Stmt1624743429276",
          "Action" : "codestar-connections:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1624743453790",
          "Action" : "codecommit:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1624743459135",
          "Action" : "codedeploy:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1624751878368",
          "Action" : "ec2:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1624743464417",
          "Action" : "codepipeline:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1624744591712",
          "Action" : "s3:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1624745010573",
          "Action" : "codebuild:*",
          "Effect" : "Allow",
          "Resource" : "*"
        },
        {
          "Sid" : "Stmt1624754937261",
          "Action" : "logs:*",
          "Effect" : "Allow",
          "Resource" : "*"
        }
      ]
    })
  }
}
