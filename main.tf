terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }
  backend "remote" {
    organization = "go-cloud"

    workspaces {
      name = "getting-started-with-modules"
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

resource "aws_ec2_instance" "web_app" {
  ami = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
}