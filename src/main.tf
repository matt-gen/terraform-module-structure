# Copyright 2024 Google. This software is provided as-is, without warranty or
# representation for any use or purpose. Your use of it is subject to your
# agreement with Google.

provider "google" {
  project = var.project_id
}

module "project" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/project?ref=v29.0.0"
  name           = var.project_id
  project_create = false
  services = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "networkmanagement.googleapis.com",
    "servicenetworking.googleapis.com",
    "storage.googleapis.com",
    "storage-component.googleapis.com",
  ]
}

# Setup a Cloud Storage bucket to store application configs
module "gcs_app_configs" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric///modules/gcs?ref=v29.0.0"
  project_id = module.project.project_id
  name       = "my-app-configs"
  versioning = var.production ? true : false
  location   = "US"
}
