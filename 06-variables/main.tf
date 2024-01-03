resource "local_file" "pet" {
  filename = var.filename
  content = var.content
}

resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}

resource "random_pet" "my-other-pet" {
  prefix = var.prefix_list[0]
}

resource local_file "my-other-petfile" {
  content = var.file-content["st1"]
  filename = var.filename
  
}