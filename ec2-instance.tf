##### key pair for EC2 instance #####

resource "aws_key_pair" "terraform" {
  key_name   = "terraform-key"
  public_key = file("terraform-key.pub")

}

######## VPC and Security Group for EC2 instance #####

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my-security-group" {
  name        = "terraform-automate-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_default_vpc.default.id
  tags = {
    Name = "Terraform Security Group"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH from anywhere"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}
###### EC2 instance #####

resource "aws_instance" "terraform_instance" {
  ami             = var.aws_ami_id
  instance_type   = var.aws_instance_type
  key_name        = aws_key_pair.terraform.key_name
  security_groups = [aws_security_group.my-security-group.name]
  user_data       = file("automate-nginx.sh")
  tags = {
    Name        = "Terraform Instance"
    Description = "This is a Terraform-managed EC2 instance."
  }
  root_block_device {
    volume_size = var.aws_root_storage_size
    volume_type = "gp3"
  }

}

