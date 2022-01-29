terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWKJGD25B2XSZDZNZ"
  secret_key = "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"
}

