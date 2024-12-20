variable "aws_region" {
  default     = "us-east-1"
  description = "Provide the region where the resources will be created"
}

variable "vpc_name" {
  default     = "neelam-vpc"
  description = "Provide the name of the VPC to be created"
}

variable "public_subnet_name" {
  default     = "neelam-public-subnet"
  description = "Provide the name of the public subnet to be created"
}

variable "private_subnet_name" {
  default     = "neelam-private-subnet"
  description = "Provide the name of the private subnet to be created"
}

variable "aws_igw_name" {
  default     = "neelam-igw"
  description = "Provide the name of the internet gateway to be created"
}

variable "public_route_table_name" {
  default     = "neelam-public-route-table"
  description = "Provide the name of the public route table to be created"
}

variable "private_route_table_name" {
  default     = "neelam-private-route-table"
  description = "Provide the name of the private route table to be created"
}