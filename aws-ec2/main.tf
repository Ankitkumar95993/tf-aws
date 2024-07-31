
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

resource "aws_instance" "myserver" {
    ami="ami-068e0f1a600cd311c"
    instance_type = "t3.micro"

    tags={
      Name = "SampleServer"
    }
  
}


// json is also supported
# {
#     "provider" : {
#     "aws":{
#         "region":""
#     }
# }

# }
 