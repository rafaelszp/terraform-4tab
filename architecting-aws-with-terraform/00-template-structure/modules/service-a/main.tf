
# Protect stateful resources
resource "aws_dynamodb_table" "cars" {
  name         = "cars"
  hash_key     = "RENAVAM"
  billing_mode = "PAY_PER_REQUEST"
  range_key    = "Make"
  attribute {
    name = "RENAVAM"
    type = "S" #string
  }
  attribute {
    name = "Make"
    type = "S"
  }

  # Protect stateful resources
  lifecycle {
    prevent_destroy = true
  }
}

# Use count for conditional values
resource "random_pet" "pet_name" {
  count = length(var.pets_un)  == 0 ? 16 : var.pets_un
}