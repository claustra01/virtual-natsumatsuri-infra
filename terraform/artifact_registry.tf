resource "google_artifact_registry_repository" "default" {
  repository_id = var.service_name
  location      = var.region
  format        = "DOCKER"

  cleanup_policies {
    id     = "keep-minimum-versions"
    action = "KEEP"
    most_recent_versions {
      keep_count            = 1
    }
  }
}
