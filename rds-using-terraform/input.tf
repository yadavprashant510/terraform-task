variable "rds_instance_name" {
  default     = "my-terraform-rds-instance"
  description = "Name of the RDS instance"
}

variable "rds_db_name" {
  description = "Name of the RDS database"
  default     = "my-terraform-rds-db"
}

variable "rds_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "prashant"
}

variable "rds_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "eclerx#123"
}