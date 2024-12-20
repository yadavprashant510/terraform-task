# Create NAT gateway in the public subnet for private subnet
resource "aws_nat_gateway" "shivani_nat" {
  allocation_id = aws_eip.shivani_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  depends_on    = [aws_internet_gateway.shivani_igw]
  tags = {
    Name = "${var.vpc_name}-ngw"
  }
}
