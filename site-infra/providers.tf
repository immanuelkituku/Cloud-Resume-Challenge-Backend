terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "immanuel-tfstate-2026"
    key          = "personal-site/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
  }
}

# Default AWS provider configuration
provider "aws" {
  region = "eu-west-1"
}

# Second AWS provider configuration (ACM certificate)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Cloudflare provider configuration
provider "cloudflare" {

}