terraform {
  required_providers {
    nomad = {
      source = "hashicorp/nomad"
      version = "2.5.0"
    }
  }
}

provider "nomad" {
  # Configuration options
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}
