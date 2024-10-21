resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "random_id" "password_db" {
  byte_length = 4
}
