##### Dev Stage #####

module "dev_infra" {
  source                        = "./infra-app"
  env                           = "dev"
  hash_key                      = "StudentID"
  bucket_name                   = "raje-dev-terraform-007-state-bucket"
  instance_count                = 2
  instance_type                 = "t3.micro"
  aws_ami_id                    = "ami-07a00cf47dbbc844c"
  aws_default_root_storage_size = 10
}

##### Prod Stage #####

module "prod_infra" {
  source                        = "./infra-app"
  env                           = "prod"
  hash_key                      = "StudentID"
  bucket_name                   = "raje-dev-terraform-007-state-bucket"
  instance_count                = 1
  instance_type                 = "t3.small"
  aws_ami_id                    = "ami-07a00cf47dbbc844c"
  aws_default_root_storage_size = 15
}

##### Stage Infra #####

module "stage_infra" {
  source                        = "./infra-app"
  env                           = "stage"
  hash_key                      = "StudentID"
  bucket_name                   = "raje-dev-terraform-007-state-bucket"
  instance_count                = 3
  instance_type                 = "t3.micro"
  aws_ami_id                    = "ami-07a00cf47dbbc844c"
  aws_default_root_storage_size = 20
}   