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


output "files_out" {
  value = local_file.log
  sensitive = true
}
