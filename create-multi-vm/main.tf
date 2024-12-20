
variable "instance_type" {
  default = "t2.micro"
  description = "The type of instance to start"
  type = string
}

resource "aws_instance" "my_instance" {
  count = 4
  ami = "ami-0182f373e66f89c85"
  instance_type = var.instance_type
  tags = {
    Name = "kelvin-vm-${count.index+1}"

    }

}