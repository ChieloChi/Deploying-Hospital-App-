resource "aws_iam_role" "consul_role" {
  name = "consul-role"

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

resource "aws_iam_instance_profile" "consul_profile" {
  name = "consul-profile"
  role = aws_iam_role.consul_role.name
}
