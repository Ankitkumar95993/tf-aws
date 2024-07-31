terraform {
  required_providers {
    aws={
      source = "hashicorp/aws"
      version = "5.60.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
   
  }
}



provider "aws" {
  # Configuration options
  region = "ap-south-1"
}


resource "random_id" "rand_id"{
    byte_length = 8
}


resource "aws_s3_bucket" "demo-bucket" {
    bucket = "demo-bucket-${random_id.rand_id.hex}"

}

resource "aws_s3_object" "bucket_data" {
   bucket  = aws_s3_bucket.demo-bucket.bucket
   source = "./mydata.txt"
   key = "data.txt"
}

output "name"{
    value = random_id.rand_id.hex
}

