# Create a Kubernetes deployment
resource "kubernetes_deployment" "geth_deployment" {
  metadata {
    name = "geth-deployment"
    labels = {
      app = "geth"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "geth"
      }
    }

    template {
      metadata {
        labels = {
          app = "geth"
        }
      }

      spec {
        container {
          image = "${var.docker_username}/go-ethereum-limechain:contracts-deployed"
          name  = "geth"

          port {
            container_port = 8545
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}

# Create a Kubernetes service (ClusterIP type for internal access)
resource "kubernetes_service" "geth_service" {
  metadata {
    name = "geth-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.geth_deployment.metadata[0].labels.app
    }
    port {
      port        = 8545
      target_port = 8545
    }
    type = "ClusterIP"
  }
}

# Output the cluster IP of the service
output "geth_service_cluster_ip" {
  value = kubernetes_service.geth_service.spec[0].cluster_ip
}

variable "docker_username" {
  description = "Docker Hub username"
  type        = string
}
