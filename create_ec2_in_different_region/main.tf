# Variables
variable "regions" {
  type    = list(string)
  default = ["us-east-1", "eu-west-1", "ap-south-1", "us-west-2", "eu-central-1"]
}

variable "tags" {
  type    = list(string)
  default = ["first_ec2", "second_ec2", "third_ec2", "fourth_ec2", "fifth_ec2", 
             "sixth_ec2", "seventh_ec2", "eighth_ec2", "ninth_ec2", "tenth_ec2"]
}

variable "ami" {
  type = map(string)
  default = {
    "us-east-1"   = "ami-00000000"
    "eu-west-1"   = "ami-00000001"
    "ap-south-1"  = "ami-00000002"
    "us-west-2"   = "ami-00000003"
    "eu-central-1"= "ami-00000004"
  }
}

# Define providers with aliases for each region
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"
}

provider "aws" {
  alias  = "ap-south-1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

provider "aws" {
  alias  = "eu-central-1"
  region = "eu-central-1"
}

# Create 2 instances in each region using for_each
resource "aws_instance" "app-dev" {
 for_each = {
    "us-east-1"   = aws.us-east-1
    "eu-west-1"   = aws.eu-west-1
    "ap-south-1"  = aws.ap-south-1
    "us-west-2"   = aws.us-west-2
    "eu-central-1"= aws.eu-central-1
  }# Creates 2 instances per region

  provider = each.value 

  count = 2  # Create 2 instances in each region

  ami           = var.ami[each.key]  # Select the AMI based on the region
  instance_type = "t2.micro"

  tags = {
    Name = element(var.tags, count.index + index(var.regions, each.key) * 2)  # Assign unique tags for each instance
  }
}
