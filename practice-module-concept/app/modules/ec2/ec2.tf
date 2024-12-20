resource "aws_instance" "prashant-vm" {
  ami = "ami-0182f373e66f89c85"
  security_groups = [ "default" ]
  key_name = "myawsrocky"
  instance_type = "t2.micro"
  tags = {
    name = var.aws_vm_name
}
}