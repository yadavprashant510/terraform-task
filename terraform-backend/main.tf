resource "aws_instance" "prashant" {
  instance_type = "t2.micro"
  ami = "ami-0182f373e66f89c85" # change this
}