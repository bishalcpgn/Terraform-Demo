terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws"{
  access_key = "ASIAWTVYWFPASG2WFEPO"
  secret_key = "xA6VTiSea85BzChyl3AIExu+kpdAXt5Y2ROmuCm+"
  region = "us-east-1"
}

