# Copyright 2024 Google. This software is provided as-is, without warranty or
# representation for any use or purpose. Your use of it is subject to your
# agreement with Google.

locals {
  # Internal variable used to enforce production environment checks
  production_check = (var.production == true && var.env != "prod") ? tobool("var.production must be false for any var.env other than production") : true
}
