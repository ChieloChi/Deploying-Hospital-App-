#!/bin/bash
sudo apt update -y
sudo apt install unzip curl -y

curl -O https://releases.hashicorp.com/vault/1.14.0/vault_1.14.0_linux_amd64.zip
unzip vault_1.14.0_linux_amd64.zip
sudo mv vault /usr/local/bin/

sudo mkdir -p /etc/vault.d /opt/vault/data
sudo cp /home/ubuntu/vault.hcl /etc/vault.d/vault.hcl

vault server -config=/etc/vault.d/vault.hcl > /var/log/vault.log 2>&1 &

