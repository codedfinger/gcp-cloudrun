resource "google_sql_database_instance" "db_instance" {
  name             = "my-database-instance"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "db" {
  name     = "mydatabase"
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "users" {
  name     = "dbuser"
  instance = google_sql_database_instance.db_instance.name
  password = "strongpassword"
}
