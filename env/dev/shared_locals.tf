locals {
  system_name = "example"
  env_name    = "dev"
  name_prefix = "${local.system_name}-${local.env_name}"
}
