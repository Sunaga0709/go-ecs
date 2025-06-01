terraform {
  backend "s3" {
    bucket       = "sunaga-terraform-state"
    key          = "go-ecs/terraform.tfstate"
    region       = "ap-northeast-1"
    use_lockfile = true
    encrypt      = true
  }

  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5"
    }
  }
}

provider "aws" {
  region = local.region
}
