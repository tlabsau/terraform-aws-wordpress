data "aws_iam_policy_document" "ec2_policy" {
  # create a service role for ec2
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "wp_ec2" {
  name                  = "${var.app}-${terraform.workspace}-ec2-role"
  force_detach_policies = true
  assume_role_policy    = data.aws_iam_policy_document.ec2_policy.json
  tags                  = var.tags
}

resource "aws_iam_instance_profile" "wp_ec2" {
  name = "${var.app}-${terraform.workspace}-instance-profile"
  role = aws_iam_role.wp_ec2.name
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "wp_ec2_policy_s3" {
  role       = aws_iam_role.wp_ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "wp_ec2_policy_ssm" {
  role       = aws_iam_role.wp_ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}
