# Notes
Spare me too much hate on this implementation, took 35 min or so and had to jump to another task this morning!

### Main points of concern
1. Container Orchestration
1. Terraform backend should be in object store like s3
1. Environment could be managed with terraspace for the sake of having a wrapper that abstracts raw terraform code management
1. When I used terraform to orchestrate a kubernetes service delivery platform, I utilized custom scripts that zipped up separate directories like config and different modules and invoked fernet encryption for the plan output. So vanilla terraform is a bit weird, would prefer a wrapper like terraspace to rely on a community maintained project instead of just my own code.
1. I validated the code with terraform, but didn't test it as I don't have an AWS account available at this very moment.
1. The code

# Container Orchestration
This is obviously a horrible way to execute the container against the newly provisioned docker host. I should've provisioned an ECS cluster, defined a task definition for the nginx container, and then a service to reference it and maintain the availability.

# BUG
When running terraform validate against the config, the variables are flagged as unexpected. Will debug, not sure why :o