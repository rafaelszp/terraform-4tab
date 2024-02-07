 data "local_file" "mydata" {
  filename = "assets/data.txt"
 }

 resource "local_file" "myfile" {
    filename = "out/myfile.txt"
    content = "Content of mydata: ${data.local_file.mydata.content}"
 }