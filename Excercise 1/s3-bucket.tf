

resource "aws_s3_bucket" "bucket" {
  bucket = "aarohit-rohitsheth-7479445555"
  region = "ap-south-1"
  tags = {
    Name        = "my bucket"
    Environment = "dev"
  }
}