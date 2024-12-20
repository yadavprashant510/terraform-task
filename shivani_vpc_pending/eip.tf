resource "aws_eip" "shivani_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.shivani_igw]
}
