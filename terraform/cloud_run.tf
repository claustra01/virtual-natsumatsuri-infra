resource "google_cloud_run_v2_service" "default" {
  name     = "${var.service_name}"
  location = "${var.region}"

  template {
    containers {
      image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.service_name}/${var.image_name}:latest"
      ports {
        container_port = 8080
      }
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "member" {
  name     = google_cloud_run_v2_service.default.name
  location = google_cloud_run_v2_service.default.location
  role     = "roles/run.admin"
  member   = "serviceAccount:terraform@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_cloud_run_v2_service_iam_binding" "noauth" {
  name     = google_cloud_run_v2_service.default.name
  location = google_cloud_run_v2_service.default.location
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}
