# resource = block name
# "local_file" = provider + resource type; local = provider, file = resource type
# "pet" = resource name
resource "local_file" "pet" {

  #Argument filename
  filename = "out/pets.txt"
  #Argument content
  content = "All the pets are petsy"
  file_permission = "0700"
}
