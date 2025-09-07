output "vpc_id" {
  value = module.vpc-deployment.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc-deployment.public_subnet_ids
}

output "private_subnet_db_ids" {
  value = module.vpc-deployment.private_subnet_db_ids
}

output "nomad_server_ips" {
  value = module.nomad-deployment.nomad_server_public_ips
}

output "rds_endpoint" {
  value = module.rds-mysql-deployment.db_endpoint
}

output "rds_username" {
  value = module.rds-mysql-deployment.db_username
}

output "rds_name" {
  value = module.rds-mysql-deployment.db_name
}
