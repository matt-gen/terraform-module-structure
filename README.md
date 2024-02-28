# Terraform Module Structure Example

This is a quick example of an option for structuring a Terraform repo that contains code to be deployed to multiple environments.

It allows the re-use of common TF code using a module, while allowing customization of the module based on input variables.

## The Module

In `/src` is the main Terraform code that will be deployed. It has input variables including `project_id`, `region` and `env`. This allows you to specify where in GCP it will be deployed to, as well as enabling your TF code to enable/configure based on the `env`:

`debug_logging = var.env == "dev" ? true : false`

As you need new customization in the module, you can add input variables to control it.

## The Environments

The different deployment environments are in `/envs`. Each folder will have a deployment that calls the module and passes in the variables specific to that environment.

Doing a `terraform apply` in the `/envs/dev` folder will try and run the Terraform module using the dev specific values.
