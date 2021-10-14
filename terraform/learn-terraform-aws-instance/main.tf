terraform {
  backend "remote" {
    organization = "TigerKungFu"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
