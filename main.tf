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
