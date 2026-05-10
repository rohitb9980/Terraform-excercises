

resource "aws_s3_bucket" "bucket" {
  bucket = "aarohit-rohitsheth-7479445555-007"
  region = "ap-south-1"
  tags = {
    Name        = "aarohit-rohitsheth-7479445555-007"
    Environment = "dev"
  }
}