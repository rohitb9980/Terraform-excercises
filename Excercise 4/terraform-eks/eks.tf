module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = local.name
  kubernetes_version = "1.33"

  endpoint_public_access                   = true
  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  addons = {
    coredns = {
      most_recent = true
    }
    vpc_cni = {
      most_recent = true
    }
    kube_proxy = {
      most_recent = true
    }
  }


  control_plane_subnet_ids = module.vpc.intra_subnets


  eks_managed_node_groups = {
    general-purpose-ng = {
      instance_types                        = ["t3.medium"]
      attach_cluster_primary_security_group = true
      min_capacity                          = 2
      desired_capacity                      = 2
      max_capacity                          = 3
      capacity_type                         = "SPOT"
    }

  }

  tags = {
    Environment = local.environment
    terraform   = "true"
  }

}

