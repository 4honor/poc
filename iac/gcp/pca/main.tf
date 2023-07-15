terraform {
  required_providers {
    acm = {
      source  = "vancluever/acme"
      version = "2.11.1"
    }
  }
}

provider "acme" {
  server_url = var.server_url
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.account_email

  external_account_binding {
    key_id      = var.eab_keyid
    hmac_base64 = var.eab_hmac
  }
}

resource "acme_certificate" "cert" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.cert_cn
  subject_alternative_names = var.cert_san

  disable_complete_propagation = on
  dns_challenge {
    provider = "exec"
  }
}




