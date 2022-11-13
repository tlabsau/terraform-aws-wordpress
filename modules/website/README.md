# Website Module

This module create the Wordpress website components.

## Module components:

- EC2 instance
- Load balancer
- DNS configuration in route53
- Firewall

## Prerequisites

This module requires the following:

- Create an AMI that has Docker, Focker-compose, and git installed; The name for AMI should be "wordpress-docker"
- Configure the auto-start for docker, and add the the main user (e.g. ec2-user) to the docker group so it can execute Docker commands without using sudo.
- Create a certificate for the domain in ACM.
-
