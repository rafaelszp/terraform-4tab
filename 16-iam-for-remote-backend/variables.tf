variable "region" {
  type = string
  default = "us-east-1"
}

variable "terraform-bucket-name" {
  type = string
  default = "s3-terraform-state"
}

variable "terraform-state-file-path" {
  type = string
  default = "state/terraform.tfstate"
}

variable "dynamodb-terraform-table" {
  type = string
  default = "terraform-state-locking"
}

variable "aws-account-number" {
  type = string
  default  = "000000000000"
}