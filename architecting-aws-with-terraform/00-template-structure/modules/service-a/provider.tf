terraform {
  required_providers {
    random = {
      source  = "hashicorp/google"
      version = "~> 3.6.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "~>5.38.0"
    }
  }
}
