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
  default     = env.github_sha
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

# Docker image to push
resource "docker_image" "app_image" {
  name  = "gcr.io/${gcp_project}/${google_artifact_registry_repository.docker_repo.repository_id}:${var.github_sha}"

  build_context = "."
  filename      = "Dockerfile"

  depends_on = [
    google_artifact_registry_repository.docker_repo,
  ]
}

# Push the image to the repository
resource "google_artifact_registry_repository_image" "pushed_image" {
  location      = google_artifact_registry_repository.docker_repo.location
  repository_id = google_artifact_registry_repository.docker_repo.repository_id
  name         = docker_image.app_image.name

  depends_on = [
    docker_image.app_image,
  ]
}
