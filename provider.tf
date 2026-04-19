terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
 # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "mahilesh-terraform-store-statefile"
    key    = "ajs/terraform.tfstate"
    region = "us-east-1"   
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  region = "us-east-1"
  name = "mahilesh_cluster"
  vpc_cidr = "172.31.0.0/16"
  azs      = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["172.31.32.0/20", "172.31.64.0/20"]
  private_subnets = ["172.31.16.0/20", "172.31.48.0/20"]
  intra_subnets   = ["172.31.80.0/20", "172.31.0.0/20"]
  tags = {
    Example = local.name
  }
}


