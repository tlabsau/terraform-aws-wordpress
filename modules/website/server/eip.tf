data "aws_eip" "wordpress_eip" {
  public_ip = "52.63.13.191"
}

resource "aws_eip_association" "wordpress_eip_association" {
  instance_id   = aws_instance.wp_ec2.id
  allocation_id = data.aws_eip.wordpress_eip.id
}
