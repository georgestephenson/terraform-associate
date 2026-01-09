provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "networking-bucket-demo34425642642"
    key = "eip.tfstate"
    region = "us-east-1"
  }
}