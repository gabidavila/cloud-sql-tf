resource "google_sql_database" "database" {
  provider = google

  name = var.schema
  #
  # charset    = "utf8mb4"
  # collation  = "utf8mb4_0900_ai_ci"
  depends_on = [google_sql_database_instance.primary, google_sql_user.users]
  instance   = google_sql_database_instance.primary.name
}

resource "google_sql_database_instance" "primary" {
  provider = google

  name                = "store-${random_id.db_name_suffix.hex}"
  region              = var.resources.database.region
  database_version    = var.resources.database.version
  deletion_protection = false

  settings {
    tier = var.resources.database.instance_type

    disk_autoresize = false
    disk_type       = "PD_SSD"
    disk_size       = var.resources.database.instance_disk_size

    availability_type = var.resources.database.high_availability ? "REGIONAL" : "ZONAL"

    # This is necessary to enable magento to run Triggers and Procedures, default is false
    database_flags {
      name  = "log_bin_trust_function_creators"
      value = true
    }

    # ipv4_enabled is necessary to use the cloud_sql_proxy to connect to your instance
    ip_configuration {
      ipv4_enabled    = true
    }

    backup_configuration {
      enabled            = true
      binary_log_enabled = true
    }
  }
}
