output "rds_instance_name" {
  value = aws_db_instance.myrds_instance.db_name
}

output "rds_host" {
  value = aws_db_instance.myrds_instance.identifier
}

output "rds_username" {
  value = aws_db_instance.myrds_instance.username
}

output "rds_password" {
  value     = aws_db_instance.myrds_instance.password
  sensitive = true
}