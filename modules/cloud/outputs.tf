output "database" {
  value = {
    instance_info = var.resources.database
    password      = module.database.cloud_sql_password
    metadata      = module.database.cloud_sql_metadata
  }
}