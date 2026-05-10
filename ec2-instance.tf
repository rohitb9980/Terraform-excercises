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
  for_each = tomap({
    
    web = "t3.micro"
    app = "t3.small"

  })
  depends_on = [ aws_security_group.my-security-group, aws_key_pair.terraform ]
  ami             = var.aws_ami_id
  instance_type   = each.value
  key_name        = aws_key_pair.terraform.key_name
  security_groups = [aws_security_group.my-security-group.name]
  user_data       = file("automate-nginx.sh")
  tags = {
    Name        = "each.key"
    Environment = var.env
    Description = "This is a Terraform-managed EC2 instance."
  }
  root_block_device {
    volume_size = var.env == "Dev" ? 20 : var.aws_default_root_storage_size
    volume_type = "gp3"
  }

}

