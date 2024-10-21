output "resources" {
  value = {
    database = module.cloud.database
  }
}

output "project" {
  value = var.project
}
