data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  default_ami_amazon = "ami-02a66f06b3557a897"
}

# get the custom AWS AMI (Instance Image)
# the ami should be created separtly before run terraform
# the ami will have installed all the requirments
data "aws_ami" "ami" {
  count       = var.ami_name == "" ? 0 : 1
  most_recent = true
  owners      = [data.aws_caller_identity.current.account_id]
  filter {
    name   = "name"
    values = [var.ami_name]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "wp_ec2" {
  ami                         = var.ami_name == "" ? local.default_ami_amazon : data.aws_ami.ami[0].image_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.ec2.id, var.db_sec_group_id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.wp_ec2.name
  subnet_id                   = var.public_subnet_ids[0]

  metadata_options {
    http_endpoint          = "enabled"
    instance_metadata_tags = "enabled"
  }

  tags        = var.tags
  volume_tags = var.tags
  root_block_device {
    volume_size = "20"
  }
}
