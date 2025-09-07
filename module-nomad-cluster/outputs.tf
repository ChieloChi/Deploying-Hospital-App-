output "nomad_security_group_id" {
  description = "Security group ID for Nomad servers"
  value       = aws_security_group.nomad_sg.id
}

output "nomad_instance_ids" {
  description = "List of Nomad server instance IDs"
  value       = aws_instance.nomad_server[*].id
}

