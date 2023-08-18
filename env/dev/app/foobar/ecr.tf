
# nginx
module "nginx" {
  source = "../../../../modules/ecr"
  name   = "${local.name_prefix}-${local.service_name}-nginx"
}

# php
module "php" {
  source = "../../../../modules/ecr"
  name   = "${local.name_prefix}-${local.service_name}-php"
}
