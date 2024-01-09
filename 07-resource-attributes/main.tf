resource "time_static" "time_output" {

}

resource "local_file" "log" {
  filename = "out/log.${time_static.time_output.id}"
  content = "[${time_static.time_output.rfc3339}] a log"
}


# Explicit dependency example
## eg. dependend resources will always be created after their 'master'

resource "random_pet" "dependend_resource" {
  prefix = "Mr"
  separator = " "
  depends_on = [ time_static.time_output ]
}
