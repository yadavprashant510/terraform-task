terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "personal"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }

}
