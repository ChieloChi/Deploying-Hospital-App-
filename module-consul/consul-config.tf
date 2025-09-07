resource "local_file" "consul_config" {
  content = <<EOF
server = true
bootstrap_expect = 1
data_dir = "/opt/consul"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
ui = true
EOF

  filename = "${path.module}/consul.hcl"
}
