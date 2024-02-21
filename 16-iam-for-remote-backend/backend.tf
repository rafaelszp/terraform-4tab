resource "aws_s3_bucket" "s3_terraform_state" {
  bucket = "${var.terraform-bucket-name}"
  tags = {
    Description = "Terraform state bucket"
  }
}


resource "aws_s3_object" "tf_state_folder" {
  bucket = "${var.terraform-bucket-name}"
  acl = "private"
  key = "state/"
  source = "/dev/null"
}

resource "aws_kms_key" "kms_state_key" {
  description = "Key used for bucket encription"
  deletion_window_in_days = 10
}


resource "aws_s3_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.tf_state_folder
  rule  {
    apply_server_side_encryption_by_default {
      kms_master_key_id   = aws_kms_key.kms_state_key
      sse_algorithm       = "aws:kms"
    }
  }

}


resource "aws_dynamodb_table" "dynamodb_terraform_state_lock" {
  name = "${var.dynamodb-terraform-table}"
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5
  hash_key = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}