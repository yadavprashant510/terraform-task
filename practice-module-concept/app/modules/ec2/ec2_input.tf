variable "aws_vm_name" {
  default = "neelam-vm"
  description = "Provide the name of the VM to be created"
}

variable "aws_instance_type" {
  default = "t2.micro"
  description = "Provide the type of the VM to be created"
}

variable "aws_vm_key" {
  default = "neelamlab"
  description = "Provide the keypair to be used for the VM"
}