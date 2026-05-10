locals {
  name                 = "rohit-eks-cluster"
  region               = "ap-south-1"
  vpc_cidr             = "10.0.0.0/16"
  azs                  = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnet_cidrs  = ["10.0.14.0/24", "10.0.15.0/24", "10.0.16.0/24"]
  private_subnet_cidrs = ["10.0.17.0/24", "10.0.18.0/24", "10.0.19.0/24"]
  environment          = "dev"
  intra_subnet_cidrs   = ["10.0.20.0/24", "10.0.21.0/24", "10.0.22.0/24"]

}