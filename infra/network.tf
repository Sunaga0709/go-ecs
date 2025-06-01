module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name                 = local.project_name
  cidr                 = "10.0.0.0/16"
  azs                  = ["${local.region}a", "${local.region}c"]
  public_subnets       = ["10.0.11.0/24", "10.0.12.0/24"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnet_names  = ["${local.project_name}-public-subnet-1a", "${local.project_name}-public-subnet-1c"]
  private_subnet_names = ["${local.project_name}-private-subnet-1a", "${local.project_name}-private-subnet-1c"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
}
