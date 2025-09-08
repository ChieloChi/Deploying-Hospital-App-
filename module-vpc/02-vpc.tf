
resource "aws_vpc" "vpc-main" {
  cidr_block           = var.vpc_cidrblock
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}
