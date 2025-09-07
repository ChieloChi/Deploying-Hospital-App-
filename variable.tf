# 🌍 Global
variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

# 🏗️ VPC Module
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

# 🔐 SSH Key
variable "key_name" {
  description = "SSH key name for EC2 access"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file (.pub)"
  type        = string
}

# 🚀 Nomad Cluster Module
variable "nomad_ami_id" {
  description = "AMI ID for Nomad server EC2 instances"
  type        = string
}

variable "nomad_instance_type" {
  description = "Instance type for Nomad servers"
  type        = string
}

variable "nomad_server_count" {
  description = "Number of Nomad servers to deploy"
  type        = number
}

# 🧠 Nomad Client ASG Module
variable "nomad_client_ami_id" {
  description = "AMI ID for Nomad client EC2 instances"
  type        = string
}

variable "nomad_client_instance_type" {
  description = "Instance type for Nomad clients"
  type        = string
}

variable "nomad_client_desired_capacity" {
  description = "Desired number of Nomad clients"
  type        = number
}

variable "nomad_client_max_size" {
  description = "Maximum number of Nomad clients"
  type        = number
}

variable "nomad_client_min_size" {
  description = "Minimum number of Nomad clients"
  type        = number
}

# 🔐 KMS (Optional)
variable "kms_key_id" {
  description = "KMS Key ID for encryption"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS Key ARN for encryption"
  type        = string
}

# 🗄️ RDS Module
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

variable "vault_ami_id" {
  description = "AMI ID for Vault EC2 instance"
  type        = string
}

variable "vault_instance_type" {
  description = "Instance type for Vault EC2"
  type        = string
}
variable "consul_ami_id" {
  description = "AMI ID for Consul EC2 instance"
  type        = string
}

variable "consul_instance_type" {
  description = "Instance type for Consul EC2"
  type        = string
}

