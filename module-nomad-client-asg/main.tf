resource "aws_iam_role" "nomad_client_role" {
  name = "nomad-client-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_instance_profile" "nomad_client_profile" {
  name = "nomad-client-profile"
  role = aws_iam_role.nomad_client_role.name
}

resource "aws_security_group" "nomad_clients_sg" {
  name        = "nomad-clients-sg"
  description = "Allow Nomad client traffic"
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

  tags = {
    Name        = "Nomad Clients SG"
    Environment = var.environment
    Project     = "Hospital App"
  }
}

resource "aws_launch_template" "nomad_client" {
  name_prefix   = "nomad-client-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = base64encode(file("${path.module}/user_data.sh"))

  iam_instance_profile {
    name = aws_iam_instance_profile.nomad_client_profile.name
  }

  vpc_security_group_ids = [aws_security_group.nomad_clients_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "Nomad Client"
      Environment = var.environment
      Project     = "Hospital App"
    }
  }
}

resource "aws_autoscaling_group" "nomad_clients" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.nomad_client.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "Nomad Client ASG"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = "Hospital App"
    propagate_at_launch = true
  }
}
