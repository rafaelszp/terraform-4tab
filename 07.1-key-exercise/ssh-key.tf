resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits = "4096"
}

resource "local_file" "rsa_pub" {
  filename = "out/id_rsa.pub"
  content = "${tls_private_key.rsa_key.public_key_openssh}"
}

resource "local_file" "rsa_pvt" {
  filename = "out/id_rsa"
  content = "${tls_private_key.rsa_key.private_key_openssh}"
}
