terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket       = "immanuel-tfstate-2026"
    key          = "personal-site/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
  }
}