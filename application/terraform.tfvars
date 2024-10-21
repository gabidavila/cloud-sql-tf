project    = "databases-conf"
gcp_region = "us-central1"
gcp_zone   = "us-central1-f"

# More infornmation 
# Pricing: https://cloud.google.com/sql/pricing#2nd-gen-pricing
# High Availability increases the cost at the double ratio
# no HA, shared resources: db-g1-small
database_server = {
  region             = "us-central1"
  instance_type      = "db-g1-small"
  version            = "MYSQL_5_7"
  instance_disk_size = 10  # GB
  high_availability  = false # If true, it will have automatic failover
}