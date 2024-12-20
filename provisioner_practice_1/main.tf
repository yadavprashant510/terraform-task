variable "map_tags" {
  type = map
  default = {
    master   = "Master",
    worker-1 = "Worker-1",
    worker-2 = "Worker-2",
    # worker-3 = "Worker-3",
    # worker-4 = "Worker-4",

  }
}

# Master Node
resource "aws_instance" "master_node" {
  ami           = "ami-0182f373e66f89c85" # Replace with your AMI
  instance_type = "t2.micro"
  key_name      = "awslab"  # Replace with your key pair
  depends_on = [aws_instance.worker_nodes]
  tags = {
    Name = "Ansible-Master"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./awslab.pem") # private key path
      host        = self.public_ip
    }

    inline = [
      # Commands for Master Node
      # Install sshpass
      "sudo yum install -y sshpass",
      "sudo useradd ansible",
      "echo 'ansible:ansible' | sudo chpasswd",
      "echo 'ansible ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/ansible",
      "sudo sed -i 's/PasswordAuthentication no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config",
      "sudo service sshd restart",
      "sudo yum install -y python3",
      "sudo yum install -y python3-pip",
      "sudo su - ansible -c 'sudo yum install -y ansible'",
      "sudo -u ansible ansible --version",
      # Add ~/.local/bin to PATH for the ansible user
      "export PATH=$PATH:'/home/ansible/.local/bin && ansible --version'",
      "sudo mkdir /etc/ansible",
      # Generate SSH key on Master
      "sudo -u ansible ssh-keygen -t rsa -f /home/ansible/.ssh/id_rsa -N ''"
    ]
  }
}

# Worker Nodes
resource "aws_instance" "worker_nodes" {
  ami           = "ami-0182f373e66f89c85" # Replace with your AMI
  instance_type = "t2.micro"
  key_name      = "awslab"  # Replace with your key pair
  for_each      = { for k, v in var.map_tags : k => v if v != "Master" }

  tags = {
    Name = "Ansible-${each.value}"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./awslab.pem") # private key path
      host        = self.public_ip
    }

    inline = [
      # Commands common for Worker Nodes
      "sudo useradd ansible",
      "echo 'ansible:ansible' | sudo chpasswd",
      "echo 'ansible ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/ansible",
      "sudo sed -i 's/PasswordAuthentication no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config",
      "sudo service sshd restart"
    ]
  }
}


# SSH Key Copy to Worker Nodes and Update Inventory
resource "terraform_data" "ssh_key_copy" {
  for_each = aws_instance.worker_nodes

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./awslab.pem") # private key path
      host        = aws_instance.master_node.public_ip
    }

    inline = [
      # Copy SSH key from Master to Worker nodes
      "sudo -u ansible sshpass -p 'ansible' ssh-copy-id -o StrictHostKeyChecking=no ansible@${each.value.private_ip}",
      # Append worker node IP to Ansible inventory
      "echo ${each.value.private_ip} | sudo tee -a /etc/ansible/hosts"
    ]
  }
}

# Output for both Master and Worker IPs
output "master_node_public_ip" {
  value = aws_instance.master_node.public_ip
}
output "master_node_private_ip" {
  value = aws_instance.master_node.private_ip
}

output "worker_node_public_ips" {
  value = {
    for k, v in aws_instance.worker_nodes : k => v.public_ip
  }
}
output "worker_node_private_ips" {
  value = {
    for k, v in aws_instance.worker_nodes : k => v.private_ip
  }
}