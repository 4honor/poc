output "crt" {
  value = lookup(acme_certificate.cert, "certificate_pem")
}

output "key" {
  value = nonsensitive(lookup(acme_certificate.cert, "private_key_pem"))
}

