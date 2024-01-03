resource "local_file" "pet" {
  filename = "./out/pets.txt"
  content = "Labrador\nGolde Retriever\nChiuaua"
}

resource "random_pet" "pet" {
  prefix = "Mrs"
  separator = "."
  length = "10"
}