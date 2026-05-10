output "ec2-public-ip" {
  value = aws_instance.terraform_instance.public_ip
}

output "ec2-private-ip" {
  value = aws_instance.terraform_instance.private_ip
}

output "ec2-public-dns" {
  value = aws_instance.terraform_instance.public_dns

}

output "ec2-instance-id" {
  value = aws_instance.terraform_instance.id

}

output "ec2-instance-state" {
  value = aws_instance.terraform_instance.instance_state
}

