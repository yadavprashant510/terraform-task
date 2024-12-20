resource "aws_instance" "my_instance" {
  ami = "ami-0182f373e66f89c85"
  instance_type = var.instance_type

  tags = {
    Name = "${var.tag_name}-environment"
  }
}