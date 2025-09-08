resource "aws_subnet" "public_subnet" {
  count                   = var.create_subnet ? var.countsub : 0
  vpc_id                  = aws_vpc.vpc-main.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
  }
}



