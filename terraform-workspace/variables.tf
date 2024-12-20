variable "instance_type" {
  default = "t2.micro"
  description = "The type of instance to run"
  type = string
}

variable "tag_name" {
    default = "default tags"
    description = "The name of the tag to apply to the instance"
}