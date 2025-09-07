#!/bin/bash
sudo apt-get update -y
sudo apt-get install unzip curl -y

# Install Nomad
curl -O https://releases.hashicorp.com/nomad/1.7.7/nomad_1.7.7_linux_amd64.zip
unzip nomad_1.7.7_linux_amd64.zip
sudo mv nomad /usr/local/bin/

# Create Nomad config
sudo mkdir -p /etc/nomad.d
cat <<EOF | sudo tee /etc/nomad.d/nomad.hcl
server {
  enabled = true
  bootstrap_expect = ${server_count}
}
bind_addr = "0.0.0.0"
data_dir  = "/opt/nomad"
EOF

# Start Nomad
sudo nomad agent -config=/etc/nomad.d/nomad.hcl > /var/log/nomad.log 2>&1 &
