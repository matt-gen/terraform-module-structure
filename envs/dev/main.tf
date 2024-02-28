# Copyright 2024 Google. This software is provided as-is, without warranty or
# representation for any use or purpose. Your use of it is subject to your
# agreement with Google.

terraform {
  backend "gcs" {
    bucket = "my-terraform-states"
    prefix = "env/dev"
  }
}

provider "google" {
}

module "my_app" {
  source = "../../src"

  project_id = "my-dev-project"
  env        = "dev"
  region     = "us-central1"
}
