output "instance_ids" {	
	value = aws_instance.ashokit_ec2_vm[*].public_ip
}