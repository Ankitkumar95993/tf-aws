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

// datasource - ami

data "aws_ami" "name"{
  most_recent = true
  owners = ["amazon"]
 
}

output "aws_ami"{
  value =  data.aws_ami.name.id
}

//data source security group

data "aws_security_group" "name"{
  tags={
    Name = "nginx-sg"
  }
}

output "security_group"{
  value = data.aws_security_group.name.id
}


// data source vpc

data "aws_vpc" "name"{
  tags={
    Name = "my_vpc"
  }

}

output "vpc_id" {
  value = data.aws_vpc.name.id
}


// az

data "aws_availability_zones" "name"{
   state = "available"
}

output "aws_zones"{
  value = data.aws_availability_zones.name
}

// to get the account details

data "aws_caller_identity" "name" {
   

}

output "caller_info"  {
  value = data.aws_caller_identity.name
  
}

//region
data "aws_region" "name"{

}

output "region"{
  value = data.aws_region.name
}

//subnet_id
data "aws_subnet" "name" {

  filter{
    name = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags={
    Name = "private-subnet"
  }
}

output "name" {
   value = data.aws_subnet.name.id
}


resource "aws_instance" "myserver" {
    ami    =  data.aws_ami.name.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.name.id
    security_groups = [data.aws_security_group.name.id]

    tags = {
        Name = "SampleServer"
    }
  
}



