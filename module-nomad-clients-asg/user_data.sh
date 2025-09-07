#!/bin/bash
sudo apt update -y
sudo apt install unzip curl -y
curl -O https://releases.hashicorp.com/nomad/1.7.7/nomad_1.7.7_linux_amd64.zip
unzip nomad_1.7.7_linux_amd64.zip
sudo mv nomad /usr/local/bin/
nomad agent -client -config=/etc/nomad.d/client.hcl &
