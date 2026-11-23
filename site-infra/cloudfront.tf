resource "aws_cloudfront_origin_access_control" "site" {
  name                              = "immanuelkituku.com"
  description                       = ""
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "site" {
  aliases             = ["immanuelkituku.com"]
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"

  tags = {
    Name = "immanuelkituku.com"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress               = true
    target_origin_id       = "immanuelkituku.com.s3.eu-west-1.amazonaws.com-mpjus4tsi69"
    viewer_protocol_policy = "redirect-to-https"
  }

  origin {
    domain_name              = "immanuelkituku.com.s3.eu-west-1.amazonaws.com"
    origin_access_control_id = aws_cloudfront_origin_access_control.site.id
    origin_id                = "immanuelkituku.com.s3.eu-west-1.amazonaws.com-mpjus4tsi69"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.site.arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}