resource "aws_acm_certificate" "site" {
  provider                  = aws.us_east_1
  domain_name               = "immanuelkituku.com"
  subject_alternative_names = ["*.immanuelkituku.com", "immanuelkituku.com"]
  key_algorithm             = "RSA_2048"
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}