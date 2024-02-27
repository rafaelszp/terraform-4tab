resource "local_file" "test_file" {
  filename = "out/teste.txt"
  content = "teste"
  file_permission = 600

  lifecycle {
    # This will invert the default order of creation, by default its destroyed first than created 
    # Atttention: If the file exists will be deleted without creating a new one
    create_before_destroy =  false
    # this will prevent  deletion (destroy) of this resource with terraform destroy command
    prevent_destroy =  false

    # when an attribute is declared in the list below, any changes will be ignored
    ignore_changes = [ 
        file_permission
     ]
  }
}