resource "google_cloud_run_v2_service" "default" {
  name     = var.service_name
  location = var.region

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.service_name}/${var.image_name}:latest"
      ports {
        container_port = 8080
      }
    }
  }
}
