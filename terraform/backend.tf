terraform {
  backend "gcs" {
    bucket = "virtual-natsumatsuri-terraform-state-backet"
    prefix = "terraform"
  }
}