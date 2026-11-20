resource "aws_s3_bucket_policy" "site" {
  bucket = "immanuelkituku.com"
  policy = jsonencode({
    Id = "PolicyForCloudFrontPrivateContent"
    Statement = [{
      Action = "s3:GetObject"
      Condition = {
        StringEquals = {
          "AWS:SourceArn" = "arn:aws:cloudfront::301178568467:distribution/E3UD0B5TTPPPSV"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = "cloudfront.amazonaws.com"
      }
      Resource = "arn:aws:s3:::immanuelkituku.com/*"
      Sid      = "AllowCloudFrontServicePrincipal"
    }]
    Version = "2008-10-17"
  })
}

resource "aws_s3_bucket_public_access_block" "site" {
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = "immanuelkituku.com"
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "site" {
  bucket              = "immanuelkituku.com"
  object_lock_enabled = false
}