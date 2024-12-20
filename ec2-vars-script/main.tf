locals {

  instances_count = 3
  instances_tags = [
    {
      Name = "Dev-Server"
    },
    {
      Name = "QA-Server"
    },
    {
      Name = "UAT-Server"
    }
  ]
}

resource "aws_instance" "ashokit_ec2_vm" {
  count           = local.instances_count
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = ["default"]
  tags = local.instances_tags[count.index]
}
