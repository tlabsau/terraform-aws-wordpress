# Simple VPC

Configuration in this directory provision resources in AWS to run wordpress website.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money (RDS, ALB, etc..). Run `terraform destroy` when you don't need these resources.
