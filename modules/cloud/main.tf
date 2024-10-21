module "database" {
  source     = "../cloud-sql"
  resources  = var.resources
  schema     = "pg"
}