# resource "aws_key_pair" "ccl-public-key" {
#   key_name   = "ccl-key-pair"
#   public_key = tls_private_key.ccl-private-key.public_key_openssh
# }

# resource "tls_private_key" "ccl-private-key" {
#   algorithm   = "RSA"
#   rsa_bits = 4096
# }

# resource "local_file" "ccl-public-key" {
#   content  = tls_private_key.ccl-private-key.private_key_pem
#   filename = "tfkey"
# }