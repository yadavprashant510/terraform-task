resource "aws_instance" "prashant_ec2_vm" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = ["default"]
  tags = {
    Name = "PY-Linux-VM"
  }
}