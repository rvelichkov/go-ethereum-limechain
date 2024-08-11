module "vpc" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=e4768508a17f79337f9f1e48ebf47ee885b98c1f"

  # Setting up VPC parameters using variables
  name = "limechain-vpc"
  cidr = "10.1.0.0/16"

  # Define availability zones and subnet types for the VPC
  azs             = ["eu-central-1a", "eu-central-1b"]
  private_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
  public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
  intra_subnets   = ["10.1.151.0/24", "10.1.152.0/24"]

  # Enable NAT gateway for outbound traffic
  enable_nat_gateway = true
  single_nat_gateway = true

  # Tagging subnets for identification and management
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = {
    Terraform   = "true"
    Environment = "limechain"
  }
}


