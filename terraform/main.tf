provider "kubernetes" {
  config_path    = "~/.kube/config"  # Ruta al archivo de configuración de Kubernetes
  config_context = "minikube"        # Nombre del contexto de Minikube
}

# Deployment para el primer API
resource "kubernetes_deployment" "monolitic" {
  metadata {
    name = "monolitic"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "monolitic"
      }
    }

    template {
      metadata {
        labels = {
          app = "monolitic"
        }
      }

      spec {
        container {
          image = "jasongiron/monolitic:latest"
          name  = "monolitic"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

# Service para el primer API
resource "kubernetes_service" "monolitic-service" {
  metadata {
    name = "monolitic-service"
  }

  spec {
    selector = {
      app = "monolitic"
    }

    port {
      port        = 5000
      target_port = 5000
    }
  }
}


