# create a vpc
resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}

# create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_name
  }
}

# create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.aws_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = var.private_subnet_name
  }
}

# create internet gateway
resource "aws_internet_gateway" "aws_igw" {
  vpc_id = aws_vpc.aws_vpc.id
  tags = {
    Name = var.aws_igw_name
  }
}
resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "neelam_nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "neelam-nat-gateway"
  }
}

# create a route table for public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.aws_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_igw.id
  }
  tags = {
    Name = var.public_route_table_name
  }
}

# Associate the Public Subnet with the Route Table
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# create a route table for private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.aws_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.neelam_nat_gateway.id
  }
  tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}