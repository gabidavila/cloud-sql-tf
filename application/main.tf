provider "google" {
  project = var.project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "cloud" {
  source = "../modules/cloud"
  resources = {
    database = var.database_server
  }
}
