resource "local_file" "log" {
  filename = var.log_filename[count.index]
  content = "[file ${count.index}] - ${random_string.log_string[count.index].result}"
  count = length(var.log_filename)
}

resource "random_string" "log_string" {
  length = 16
  special = false
  lower = true
  count = length(var.log_filename)
}