output "vpc_id" {
  value = aws_vpc.aws_vpc.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.neelam_nat_gateway.id
}

output "aws_public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "aws_private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
output "public_route_table" {
  value = aws_route_table.public_route_table.route
}

output "private_route_table" {
  value = aws_route_table.private_route_table.route
}