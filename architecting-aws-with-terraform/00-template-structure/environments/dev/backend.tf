# backend state location configurations
terraform {
  backend "s3" {
    # Existing bucket
    bucket            =  var.state_backend.bucket_name
    #this object must exist: filename 
    key               = var.state_backend.bucket_key
    region            = var.region
    #the existing dynamodb table must have a hash_key named 'lockID'
    dynamodb_table    = var.state_backend.dynamodb_table
  }
}