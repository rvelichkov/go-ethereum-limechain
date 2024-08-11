# Terraform block specifying the required providers and their versions
terraform {
  required_version = "~> 1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.31.0"
    }
  }
}

# AWS provider configuration
provider "aws" {
  region = "eu-central-1"
}

# Kubernetes provider basic configuration
provider "kubernetes" {
  config_path = "~/.kube/config" # Path to the kubeconfig file, uncomment if using a local kubeconfig
}
