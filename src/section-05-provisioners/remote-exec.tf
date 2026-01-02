provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"
  key_name = "EC2 Tutotiral"
  vpc_security_group_ids = ["sg-072137ce87099d5a0"]

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./EC2Tutotiral.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}