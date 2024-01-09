resource "time_static" "time_output" {

}

resource "local_file" "log" {
  filename = "out/log.${time_static.time_output.id}"
  content = "[${time_static.time_output.rfc3339}] a log"
}
