output "db_host" {
  value = aws_db_instance.db-rds.endpoint
}

output "db_name" {
  value = aws_db_instance.db-rds.name
}

output "db_user" {
  value = var.db_user
}

output "db_password" {
  sensitive = true
  value = aws_db_instance.db-rds.password
}