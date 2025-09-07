#!/bin/bash
sudo apt update -y
sudo apt install unzip curl -y

curl -O https://releases.hashicorp.com/consul/1.15.2/consul_1.15.2_linux_amd64.zip
unzip consul_1.15.2_linux_amd64.zip
sudo mv consul /usr/local/bin/

sudo mkdir -p /etc/consul.d /opt/consul
sudo cp /home/ubuntu/consul.hcl /etc/consul.d/consul.hcl

consul agent -config-file=/etc/consul.d/consul.hcl > /var/log/consul.log 2>&1 &
