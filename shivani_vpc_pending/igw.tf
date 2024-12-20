# Create an Internet Gateway for the Public Subnet
resource "aws_internet_gateway" "shivani_igw" {
  vpc_id = aws_vpc.shivani_vpc.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

