variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Nomad server"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "server_count" {
  description = "Number of Nomad servers to deploy"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for Nomad servers"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

