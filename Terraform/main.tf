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
     acl       = "public-read"

     policy  = <<EOF
  {
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
   "effect" : "Allow",
         "resource" : "arn:aws:s3:::githubtest12345/*",
         "principal" : "*"
      }
    ]
  }
EOF
website {
       index_document = "index.html"
   }
}
