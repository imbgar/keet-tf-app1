module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 1.26.0"

  name               = "app-dev"
  cidr               = "10.10.10.0/24"
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets    = ["10.10.10.0/27", "10.10.10.32/27", "10.10.10.64/27"]
  public_subnets     = ["10.10.10.96/27", "10.10.10.128/27", "10.10.10.160/27"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags = {
    Environment = "dev"
    Owner       = "theteam@keethealth.com"
  }
}

module "docker-base" {
  source = "git::https://github.com/imbgar/keet-tf-example.git"

  env           = "dev"
  contact       = "theteam@keethealth.com"
  project       = "keet-service"
  vpc_id        = module.vpc.vpc_id
  instance_type = "m5.large"
}

