terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

provider "aws" {
  # Configuration options
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "gc"
  region                  = "us-east-1"
}

module "s3_bucket" {
  source = "./s3/"

  s3_bucket_name = "${var.student_name}-gocloud-s3-bucket"
}