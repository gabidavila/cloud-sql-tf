output "cloud_sql_password" {
  value = random_id.password_db.hex
}

output "cloud_sql_metadata" {
  value = {
    main_schema     = google_sql_database.database.name
    public_ip       = google_sql_database_instance.primary.public_ip_address
    private_ip      = google_sql_database_instance.primary.private_ip_address
    connection_name = google_sql_database_instance.primary.connection_name
    instance_name   = google_sql_database_instance.primary.name
  }
}
