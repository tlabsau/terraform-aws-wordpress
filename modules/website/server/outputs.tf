output "sec_group_id" {
  description = "Security Group ID for the EC2 instance"
  value       = aws_security_group.ec2.id
}

output "instance_id" {
  description = "Wordpress EC2 instance ID"
  value       = aws_instance.wp_ec2.id
}
