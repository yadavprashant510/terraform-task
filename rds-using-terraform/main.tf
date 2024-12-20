# resource "aws_db_instance" "myrds_instance" {
#   allocated_storage    = 10
#   db_name              = var.rds_db_name
#   engine               = "postgres"
#   engine_version       = "14"
#   instance_class       = "db.t3.micro"
#   username             = var.rds_username
#   password             = var.rds_password
#   skip_final_snapshot  = true
# }

resource "aws_db_instance" "myrds_instance" {
  allocated_storage           = 10
  db_name                     = "mydb"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t3.micro"
  manage_master_user_password = true
  username                    = "foo"
  parameter_group_name        = "default.mysql8.0"
}