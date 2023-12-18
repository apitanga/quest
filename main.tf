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
