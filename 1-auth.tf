terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" 
    }
  }

   backend "s3" {
    bucket  = "my-new-tf-backend-bucket-12345"
    key     = "jenkins-test-013125.tfstate"
    region  = "us-east-1"
    encrypt = true                              
  } 
}

provider "aws" {
  region  = "us-east-1"
  
}

