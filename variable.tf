variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

# VPC Module Variables
variable "vpc_cidrblock" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "countsub" {
  description = "Number of subnets to create"
  type        = number
}

variable "create_subnet" {
  description = "Whether to create subnets"
  type        = bool
}

variable "create_elastic_ip" {
  description = "Whether to create Elastic IPs"
  type        = bool
}

# Nomad Module Variables
variable "nomad_ami_id" {
  description = "AMI ID for Nomad EC2 instances"
  type        = string
}

variable "nomad_instance_type" {
  description = "Instance type for Nomad EC2"
  type        = string
}

variable "nomad_desired_capacity" {
  description = "Desired number of Nomad instances"
  type        = number
}

variable "nomad_max_size" {
  description = "Maximum number of Nomad instances"
  type        = number
}

variable "nomad_min_size" {
  description = "Minimum number of Nomad instances"
  type        = number
}

variable "key_name" {
  description = "SSH key name for EC2 access"
  type        = string
}

variable "kms_key_id" {
  description = "KMS Key ID for encryption"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS Key ARN for encryption"
  type        = string
}

# RDS Module Variables
variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Storage size for RDS (in GB)"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
