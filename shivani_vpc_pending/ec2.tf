# Create a Public EC2 instance
resource "aws_instance" "shivani_pub_vm" {
  ami             = var.ami_id
  key_name        = var.key_pair
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet[0].id
  security_groups = [aws_security_group.shivani_sg.id]
  tags = {
    Name = var.ec2_instance_name[0]
  }
}
resource "aws_instance" "shivani_priv_vm" {
  ami             = var.ami_id
  key_name        = var.key_pair
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.private_subnet[0].id
  security_groups = [aws_security_group.shivani_sg.id]
  tags = {
    Name = var.ec2_instance_name[1]
  }
}
