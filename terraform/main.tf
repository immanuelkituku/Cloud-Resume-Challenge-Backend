provider "aws" {
  region = var.region
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 5.14.0"

  bucket = var.bucket_name
  attach_policy = true
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
}