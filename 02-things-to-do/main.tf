resource "local_file" "things-to-do" {
  filename = "out/things-to-do.txt"
  content = "#1"
}
resource "local_file" "more-things-to-do" {
  filename = "out/more-things-to-do.txt"
  content = "#2"
}