resource "google_sql_user" "users" {
  provider = google
  name     = "magento"
  instance = google_sql_database_instance.primary.name
  host     = "%"
  password = random_id.password_db.hex
}
