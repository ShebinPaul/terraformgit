terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
  
backend "s3" {
       bucket = "ivnc-test-access"
       #key    = "[Remote_State_S3_Bucket_Key]"
       region = "east-us-1"
   }



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
