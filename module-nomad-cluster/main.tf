resource "aws_key_pair" "nomad_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "nomad_sg" {
  name        = "nomad-sg"
  description = "Allow Nomad traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 4646
    to_port     = 4648
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nomad_server" {
  count         = var.server_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.nomad_key.key_name
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [aws_security_group.nomad_sg.id]

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "Nomad-Server-${count.index}"
    Environment = var.environment
  }
}

