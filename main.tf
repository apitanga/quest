terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    docker = {
      source = "kreuzwerker/docker"
    }
  }

  cloud {
    organization = "Pitangaville"
    workspaces {
      name = "quest"
    }
  }
}

# Declare variables
variable "gcp_project" {
  description = "Google Cloud project ID"
  type        = string
  default     = "quest-408401"
}

variable "github_sha" {
  description = "GitHub SHA hash of the commit"
  type        = string
}

# Artifact Registry Repository
resource "google_artifact_registry_repository" "docker_repo" {
  location      = "us-central1"
  repository_id = "quest"
  format        = "DOCKER"

  labels = {
    env = "production"
    app = "quest"
  }
}

# Deploy to Cloud Run
resource "google_cloud_run_service" "default" {
  name     = "my-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/${var.gcp_project}/quest:${var.github_sha}"
        resources {
          limits = {
            cpu = "2"  # Allocate 2 CPUs
            memory = "2Gi"  # Allocate 2GB of memory
        }
      }
    }
    
  }
}
}

# Custom Domain and SSL Configuration

variable "custom_domain" {
  description = "The custom domain for the Cloud Run service"
  type        = string
  default     = "pomo.dev"
}

#resource "google_cloud_run_domain_mapping" "default" {
#  location = "us-central1"
#  name     = var.custom_domain
#
#  metadata {
#    namespace = var.gcp_project
#}
#
#  spec {
#    route_name = google_cloud_run_service.default.name
#  }
#}

resource "google_compute_managed_ssl_certificate" "default" {
  name    = "my-ssl-cert"
  managed {
    domains = [var.custom_domain]
  }
}

# Output the Cloud Run service URL
output "cloud_run_service_url" {
  value = google_cloud_run_service.default.status[0].url
}
