data "template_file" "cars_json_template" {
  template = file("${path.module}/templates/cars.json.tpl")
  vars = {
    schema_version = var.schema_version
  }
}

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
}

resource "aws_dynamodb_table_item" "car-items" {
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key
  range_key  = aws_dynamodb_table.cars.range_key
  item       = data.template_file.cars_json_template.rendered
}
