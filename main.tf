terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Pitangaville"
    workspaces {
      name = "quest"
    }
  }
}

# Provider configuration
provider "google" {
  project = "quest-408401"
  region = "us-central1"
}
provider "docker" {
  source  = "hashicorp/docker"
  version = "~> 4.6"
}

# Artifact Registry Repository
resource "google_artifact_registry_repository" "docker_repo" {
  location      = "us-central1"
  repository_id = "quest"
  format        = "DOCKER"

  labels = {
    env = "production"
  }
  # Add an output
  output "url" {
    value = self.url
}
  # Get the repository URL as output
  output "url" {
    value = self.url
  }
}

# Docker image to push
resource "docker_image" "app_image" {
  name  = "gcr.io/${google.project}/${google_artifact_registry_repository.docker_repo.repository_id}:${github.sha}"

  build_context = "."

  # Use local Dockerfile
  filename = "Dockerfile"

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
