provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "networking-bucket-demo34425642642"
    key    = "eip.tfstate"
    region = "us-east-1"
  }
}