# Base Module

This module create the necessary components to run a Wordpress website.

## Module components:

- S3 Bucket to store the website files and premium plugins
- VPC, and the related subnets (private, public, and database)
- RDS database, that contains the wordpress database

## Prerequisites

This module requires the following:

- Create ssm parameter for the database password, parameter name should be: /{app}/{workspace}/db_password

