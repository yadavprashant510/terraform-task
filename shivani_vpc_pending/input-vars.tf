variable "aws_region" {
  description = "The AWS region to launch the resources in."
  default     = "us-east-1"
}


variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}


variable "vpc_name" {
  description = "The name of the VPC."
  default     = "custom-vpc"
}


variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "availability_zone" {
  description = "The availability zone for the subnet."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


variable "subnet_name" {
  description = "The name of the subnet."
  type        = list(string)
  default     = ["custom-subnet1", "custom-subnet2", "custom-subnet3"]
}


variable "security_group_name" {
  description = "The name of the security group."
  default     = "custom-sg"

}


variable "instance_type" {
  description = "The type of the EC2 instance."
  default     = "t2.micro"
}


variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  default     = "ami-0453ce6279422709a"
}


variable "key_pair" {
  description = "The SSH key pair for the instance connection"
  default     = "shivani_key"
}


variable "ec2_instance_name" {
  description = "The name of the EC2 instance."
  type        = list(string)
  default     = ["VM-1", "VM-2"]
}
