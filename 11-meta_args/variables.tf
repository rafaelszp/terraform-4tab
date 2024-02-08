variable "log_filename" {
  default = [
    "out/out.0.log",
    "out/out.1.log",
    "out/out.2.log",
    "out/out.4.log",
    "out/out.5.log",
    "out/out.6.log",
    "out/out.7.log",
    "out/out.8.log"
  ]
}

variable "log_set" {
  type = set(string)
  default = [
    "out/out_set.0.log",
    "out/out_set.1.log",
    "out/out_set.2.log",
    "out/out_set.4.log",
    "out/out_set.5.log",
    "out/out_set.6.log",
    "out/out_set.7.log",
    "out/out_set.8.log"
  ]
}


output "files_out" {
  value = local_file.log
  sensitive = true
}
output "files_out_list" {
  value = local_file.log_list
  sensitive = true
}
output "files_out_set" {
  value = local_file.log_fileset
  sensitive = true
}
