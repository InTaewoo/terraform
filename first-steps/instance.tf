provider "aws" {
  access_key = "AKIAQ4J5YF72Z6O3XVX7"
  secret_key = "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"
  region     = "ap-northeast-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


  resource "aws_instance" "example" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    tags = {
      Name = "HelloWorld"
    }
  }

