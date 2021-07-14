terraform {
  required_version = ">= 0.15.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    region         = "ap-southeast-1"
    bucket         = "nguyenhieu8790-tf-bucket"
    key            = "terraform.tfstate"
    dynamodb_table = "tfstate-ap-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}