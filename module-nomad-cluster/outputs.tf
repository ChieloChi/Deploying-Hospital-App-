output "nomad_server_ips" {
  value = [for instance in aws_instance.nomad_server : instance.public_ip]
}
