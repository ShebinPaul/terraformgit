provider "aws" {
  version = "~>3.0"
  region  = "us-east-1"
}

# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "4.22.0"
#     }
#   }
# }

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "githubtest12345"
website {
       index_document = "index.html"
   }
}
