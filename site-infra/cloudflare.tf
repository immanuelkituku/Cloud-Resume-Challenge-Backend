resource "cloudflare_dns_record" "apex" {
  zone_id = var.zone_id
  name    = "immanuelkituku.com"
  type    = "CNAME"
  content = aws_cloudfront_distribution.site.domain_name
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "acm_validation" {
  zone_id = var.zone_id
  name    = "_27d240b28199a5707c292c5532ce095b.immanuelkituku.com"
  type    = "CNAME"
  content = "_9aa3e73ca859978e49aa1b6a4eff372a.jkddzztszm.acm-validations.aws"
  proxied = false
  ttl     = 1
}