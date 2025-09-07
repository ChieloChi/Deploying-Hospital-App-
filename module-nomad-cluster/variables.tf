variable "aws_region" {
  default = "us-west-2"
}

variable "key_name" {}
variable "public_key_path" {}
variable "ami_id" {}
variable "instance_type" {
  default = "t3.micro"
}

variable "server_count" {
  default = 3
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
