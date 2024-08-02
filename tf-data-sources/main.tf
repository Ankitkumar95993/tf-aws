terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "name"{
  most_recent = true
  owners = ["amazon"]
 
}

output "aws_ami"{
  value =  data.aws_ami.name.id
}

resource "aws_instance" "myserver" {
    ami    =  data.aws_ami.name.id
    instance_type = "t2.micro"

    tags = {
        Name = "SampleServer"
    }
  
}

