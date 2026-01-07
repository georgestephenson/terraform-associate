provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/using-vars"
  instance_type = "t3.micro"
  ami = "ami-xyz"
}