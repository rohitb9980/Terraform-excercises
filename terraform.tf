terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }

  backend "s3" {
    bucket       = "aarohit-rohitsheth-7479445555-007"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}