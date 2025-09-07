variable "ami_id" {}
variable "instance_type" { default = "t3.micro" }
variable "subnet_id" {}
variable "vpc_id" {}
variable "key_name" {}
variable "environment" { default = "dev" }
variable "aws_region" { default = "us-west-2" }
variable "kms_key_id" {}
variable "kms_key_arn" {}
