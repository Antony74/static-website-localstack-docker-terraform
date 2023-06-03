resource "aws_acm_certificate" "this" {
  validation_method = "DNS"

  domain_name = var.domain_name

  subject_alternative_names = [
    "*.${var.domain_name}"
  ]
}