provider "aws" {
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "Demo_Bucket" {
    bucket = "my-bucket-versioning-enabled"
    acl = "private"
  


    versioning {
        enabled =true
    }

    website {
      index_document = "index.html"
      error_document = "error.html"
    }

}