resource "google_cloud_run_service" "service" {
  name     = "my-cloud-run-service"
  location = var.region

  template {
    spec {
      containers {
        image = var.cloud_run_image
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service = google_cloud_run_service.service.name
  location = google_cloud_run_service.service.location
  role    = "roles/run.invoker"
  member  = "allUsers"
}
