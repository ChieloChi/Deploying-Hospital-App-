resource "local_file" "vault_config" {
  content = <<EOF
storage "file" {
  path = "/opt/vault/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = true
}

seal "awskms" {
  region     = var.aws_region
  kms_key_id = var.kms_key_id
}
EOF

  filename = "${path.module}/vault.hcl"
}

