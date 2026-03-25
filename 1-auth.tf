terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # Use latest version if possible
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  
}

