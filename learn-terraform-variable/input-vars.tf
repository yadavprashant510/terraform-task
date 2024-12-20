variable "ami" {
  description = "Amazon machine image id"
  default     = "ami-0182f373e66f89c85"
}

variable "instance_type" {
  description = "Represens EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = ""
  default     = "myawsrocky"
}