resource "aws_instance" "consul" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.consul_profile.name
  vpc_security_group_ids = [aws_security_group.consul_sg.id]
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Name        = "Consul Server"
    Environment = var.environment
    Project     = "Hospital App"
  }
}
