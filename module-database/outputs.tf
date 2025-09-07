output "db_endpoint" {
  value = aws_db_instance.mysql_db_instance.endpoint
}

output "db_username" {
  value = var.db_username
}

output "db_name" {
  value = var.db_name
}

