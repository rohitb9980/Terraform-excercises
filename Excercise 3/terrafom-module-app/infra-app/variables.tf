
variable "aws_default_root_storage_size" {
  description = "Size of root storage for EC2 instance in GB"
  type        = number
}

variable "aws_ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "env" {
  description = "This is my Environment"
  type    = string
}

variable "bucket_name" {
  description = "This is my Bucket Name"
  type    = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
    description = "This is Instance Type"
    type =  string
  
}

variable "hash_key" {
  description = "Hash key for DynamoDB table"
  type        = string
}