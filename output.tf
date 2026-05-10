output "ec2-public-ip" {
  value = [ for instance in aws_instance.terraform_instance : instance.public_ip ]
}

output "ec2-private-ip" {
  value = [ for instance in aws_instance.terraform_instance : instance.private_ip ]
}

output "ec2-public-dns" {
  value = [ for instance in aws_instance.terraform_instance : instance.public_dns ]
}

output "ec2-instance-id" {
  value = [ for instance in aws_instance.terraform_instance : instance.id ]
}

output "ec2-instance-state" {
  value = [ for instance in aws_instance.terraform_instance : instance.instance_state ]
}

