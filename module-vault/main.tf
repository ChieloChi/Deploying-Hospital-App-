resource "aws_instance" "vault" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.vault_profile.name
  vpc_security_group_ids = [aws_security_group.vault_sg.id]
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Name        = "Vault Server"
    Environment = var.environment
    Project     = "Hospital App"
  }
}

