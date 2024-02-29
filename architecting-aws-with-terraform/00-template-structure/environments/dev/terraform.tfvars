region = "us-east-1"
ram_size_gb = 8
external_access = true 
state_backend = {
  "bucket_name" = "dev-state-bucket-01"
  "bucket_key" = "state/terraform.tfstate"
  "dynamodb_table" = "state_locking"
}