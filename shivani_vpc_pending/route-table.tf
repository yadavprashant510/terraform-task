# Public Route Table for Public Subnet
resource "aws_route_table" "shivani_pub_rt" {
  vpc_id = aws_vpc.shivani_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shivani_igw.id
  }
  tags = {
    Name = "${var.vpc_name}-pub-rt"
  }
}


# private Route Table for private Subnet
resource "aws_route_table" "shivani_priv_rt" {
  vpc_id = aws_vpc.shivani_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.shivani_nat.id
  }
  tags = {
    Name = "${var.vpc_name}-pub-rt"
  }
}


# Associate the Public Subnet with the Public Route Table
resource "aws_route_table_association" "pub_subnet_ass" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.shivani_pub_rt.id
}


# Associate the Private Subnet with the Private Route Table
resource "aws_route_table_association" "priv_subnet_ass" {
  subnet_id      = aws_subnet.private_subnet[0].id
  route_table_id = aws_route_table.shivani_priv_rt.id
}
