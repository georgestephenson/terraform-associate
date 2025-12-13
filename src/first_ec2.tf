provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "terraform"
#  region = "us-east-1"
#  access_key = "access_key_here"
#  secret_key = "secret_key_here"
}

resource "aws_instance" "myec2" {
  ami = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"

  tags = {
    Name = "my-first-ec2"
  }
}