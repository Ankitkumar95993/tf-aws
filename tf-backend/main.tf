
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.60.0"
    }
  }

  backend "s3"{
      bucket = "demo-bucket-270b8660eee5d61c"
      key = "backend.tfstate"
      region = "ap-south-1"
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

resource "aws_instance" "myserver" {
    ami="ami-068e0f1a600cd311c"
    instance_type = "t3.micro"

    tags={
      Name = "SampleServer"
    }
  
}

 