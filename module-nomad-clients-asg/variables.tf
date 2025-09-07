variable "ami_id" {}
variable "instance_type" { default = "t3.micro" }
variable "desired_capacity" { default = 2 }
variable "max_size" { default = 5 }
variable "min_size" { default = 1 }
variable "subnet_ids" { type = list(string) }
variable "vpc_id" {}
variable "environment" { default = "dev" }

