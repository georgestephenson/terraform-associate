provider "aws" {
  region = "us-east-1"
}

locals {
  instance_type = {
    default = "t3.nano"
    dev = "t3.micro"
    prod = "m5.large"
  }
}

resource "aws_instance" "myec2" {
  ami = "ami-068c0051b15cdb816"
  instance_type = local.instance_type[terraform.workspace]
}