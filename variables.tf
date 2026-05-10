variable "aws_instance_type" {
  description = "Type of EC2 instance"
  default     = "t3.micro"
  type        = string
}

variable "aws_default_root_storage_size" {
  description = "Size of root storage for EC2 instance in GB"
  default     = 15
  type        = number
}

variable "aws_ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-07a00cf47dbbc844c"
  type        = string
}

variable "env" {
 default = "dev"
 type = string  
}