resource "aws_instance" "webserver_01" {
  ami           = "ami-0de8a7e805b017a1f"
  instance_type = "t2.micro"
  tags = {
    Name        = "webserver"
    Description = "A Default nginx server"
  }

  user_data = <<EOF
              #!/bin/bash
              sudo apt update
              sudo apt install nginx -y
              systemctl enable nginx
              systemctl start nginx
              EOF 

  key_name = aws_key_pair.web.id

  provisioner "local-exec" {
    command = "echo ${aws_instance.webserver_01.public_ip} >> /tmp/public_ip.txt"
  }

  provisioner "local-exec" {
    command = "echo Instance ${self.public_ip} Destroyed > /tmp/instance_state.txt"
    when    = destroy
  }

  vpc_security_group_ids = [
    aws_security_group.ssh_access.id
  ]
}

resource "aws_instance" "webserver_02" {
  ami           = "ami-0de8a7e805b017a1f"
  instance_type = "t2.micro"
  tags = {
    Name        = "webserver"
    Description = "A Default nginx server"
  }

  key_name = aws_key_pair.web.id
  vpc_security_group_ids = [
    aws_security_group.ssh_access.id
  ]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "systemctl enable nginx",
      "systemctl start nginx"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("./web")
  }
}

resource "aws_key_pair" "web" {
  public_key = file("./web.pub")
}


resource "aws_security_group" "ssh_access" {
  name        = "ssh-access-webserver"
  description = "Allow SSH access to the webserver01 instance from the internet"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "webserver01_publicip" {
  value = aws_instance.webserver_01.public_ip
}
