terraform {
  backend "s3" {
    bucket = "ticket-booking-terraform-state-vicky123"
    key    = "serverless-app/terraform.tfstate"
    region = "us-east-1"
  }
}   


terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
