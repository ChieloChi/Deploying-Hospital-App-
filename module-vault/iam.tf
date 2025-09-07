resource "aws_iam_role" "vault_role" {
  name = "vault-role"

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

resource "aws_iam_instance_profile" "vault_profile" {
  name = "vault-profile"
  role = aws_iam_role.vault_role.name
}

resource "aws_iam_policy" "vault_kms_policy" {
  name        = "vault-kms-policy"
  description = "Allow Vault to use AWS KMS for auto-unseal"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "kms:Decrypt",
        "kms:Encrypt",
        "kms:GenerateDataKey"
      ],
      Resource = var.kms_key_arn
    }]
  })
}

resource "aws_iam_role_policy_attachment" "vault_kms_attach" {
  role       = aws_iam_role.vault_role.name
  policy_arn = aws_iam_policy.vault_kms_policy.arn
}
