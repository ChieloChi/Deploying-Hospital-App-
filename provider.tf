terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
    nomad = {
      source  = "hashicorp/nomad"
      version = "2.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "nomad" {
  # Configuration options
}

