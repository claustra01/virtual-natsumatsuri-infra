resource "google_storage_bucket" "default" {
  name     = var.bucket_name
  location = var.region
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.admin"
  member = "serviceAccount:terraform@${var.project_id}.iam.gserviceaccount.com"
}
