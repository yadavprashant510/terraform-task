# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.shivani_vpc.id
  cidr_block              = var.subnet_cidr[0]
  availability_zone       = var.availability_zone[0]
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_name[0]
  }
}
# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.shivani_vpc.id
  cidr_block              = var.subnet_cidr[1]
  availability_zone       = var.availability_zone[1]
  map_public_ip_on_launch = false
  tags = {
    Name = var.subnet_name[1]
  }
}
