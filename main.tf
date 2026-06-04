provider "aws" {
  region = var.region
}

module "s3-bucket"{
    source = "terraform-aws-modules/s3-bucket/aws"
    version = "~> 5.14.0"

    bucket = "test-bucket-1234567890"
}

