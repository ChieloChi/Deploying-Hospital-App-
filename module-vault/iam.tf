/*
resource "aws_iam_policy" "vault_kms_policy" {
  name        = "vault-kms-policy"
  description = "Allow Vault to use AWS KMS for auto-unseal"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:GenerateDataKey*"
        ],
        Resource = [var.kms_key_arn]
      }
    ]
  })
}
*/

