output "prashant_vm_public_ip" {
  value = aws_instance.prashant-vm.public_ip
}

output "prashant_vm_private_ip" {
  value = aws_instance.prashant-vm.private_ip
}