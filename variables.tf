# Project ID where the resources will be created
variable "project_id" {
  description = "The ID of the project in which to create resources"
  type        = string
}

# Region where the resources will be deployed
variable "region" {
  description = "Region for Cloud Run, Cloud SQL, and other resources"
  type        = string
  default     = "us-central1"  # You can set this to your preferred region
}

# Cloud Run Container Image
variable "cloud_run_image" {
  description = "The Docker image to deploy to Cloud Run"
  type        = string
}

# SSL certificate path (for Load Balancer)
variable "ssl_certificate" {
  description = "Path to the SSL certificate"
  type        = string
}

# SSL private key path (for Load Balancer)
variable "ssl_private_key" {
  description = "Path to the SSL private key"
  type        = string
}
