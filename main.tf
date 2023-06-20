# Reference for the Version used , as per documentation 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

# Region referernce from Variable
provider "aws" {
  region = var.region
}