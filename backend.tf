terraform {
  backend "s3" {
    bucket         = "hospital-app-terraform-state"
    key            = "env/dev/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-locks"
    region         = "us-east-1"
  }
}
