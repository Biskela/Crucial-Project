acm certificate #

# resource "aws_acm_certificate" "sika_cert" {
#   domain_name       = "example.com"
#   validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
# }