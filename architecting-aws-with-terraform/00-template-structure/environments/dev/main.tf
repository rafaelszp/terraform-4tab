
provider "aws" {
  region = var.region
}

module "service_a" {
  source = "../../modules/service-a"
  ram_size_gb = var.ram_size_gb
  enable_external_access = var.external_access
  region = var.region
}