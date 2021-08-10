terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "default"
}

resource "aws_instance" "web" {
  ami           = "ami-0453cb7b5f2b7fca2"
  instance_type = "t2.micro"

  tags = {
    Name = "webserver-refreshed"
  }
}

