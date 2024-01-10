
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits = "4096"
}

output "public_key_ssh" {
  value = "${tls_private_key.rsa_key.public_key_openssh}"
}
output "private_key_ssh" {
  value = "${tls_private_key.rsa_key.private_key_openssh}"
  sensitive = true
}