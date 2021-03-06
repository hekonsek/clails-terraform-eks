locals {
  project = read_terragrunt_config("../../../terragrunt.hcl")
  environment = read_terragrunt_config("../terragrunt.hcl")
  environment_full = "${local.project.locals.project}-${local.environment.locals.environment}"
}

terraform {
  source = "github.com/hekonsek/clails-terraform-vpc?ref=0.0.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "${local.environment_full}"
}

