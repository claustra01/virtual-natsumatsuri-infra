resource "google_artifact_registry_repository" "default" {
  repository_id = "${var.project_id}"
  location      = var.region
  format        = "DOCKER"

  cleanup_policies {
    id     = "keep-minimum-versions"
    action = "KEEP"
    most_recent_versions {
      keep_count = 1
    }
  }
}

resource "google_artifact_registry_repository_iam_member" "member" {
  repository = google_artifact_registry_repository.default.name
  location   = google_artifact_registry_repository.default.location
  role       = "roles/artifactregistry.admin"
  member     = "serviceAccount:terraform@${var.project_id}.iam.gserviceaccount.com"
}
