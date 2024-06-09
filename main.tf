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
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t3.small"
  tags = {
    Name = "ExampleAppServerInstance"
  }
}

# Creating key-pair on AWS using SSH-public key
resource "aws_key_pair" "minecraft_key" {
    key_name = "minecraft-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDyTh3ZUqM7Lum3TUB0NzpJjiP1Mhh01t2tBr363Mjk8PqfoLUEbmAipCTcuD/cwaka/j14wG3D6Fl5QXNEozOayBUqObalBttdOFcvZYqV4y1cymNPm8M1lX/+F8jNwzAGvubcM3G2uBvamnvz6q3heOURh+dXGagMZocAMss7FjDNuWXpyNmX+W0V+FzF3PL0k4KZ4mrfQaPiL+CvbIRvNvN5FByw/iBDJu7+LGdC+M/yu7qHAN/IfK5rfarUNSn9AYUbPosceRLYnqcQQvipaJY32Y5NsGuuUYQl5TlOk0vmAJddJsyxoRDx7TtAf76MM1QDnFjMfoyloVhtDybZ nicks@Nickson"
}

