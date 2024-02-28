# Copyright 2024 Google. This software is provided as-is, without warranty or
# representation for any use or purpose. Your use of it is subject to your
# agreement with Google.

variable "project_id" {
  description = "The id of the GCP Project to deploy to."
  type        = string
}

variable "env" {
  description = "The name of the environment being deployed."
  type        = string
}

variable "region" {
  description = "The root region to deploy to."
  type        = string
}

variable "production" {
  description = "Production Environment - Set this to true to enforce extra checks"
  type        = bool
  default     = false
}
