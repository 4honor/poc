variable "server_url" {
  description = "the url of acme server"
  type        = string
  default     = "https://dv.acme-v02.api.pki.goog/directory"
}

variable "account_email" {
  description = "the email of your acme account"
  type        = string
}

variable "eab_keyid" {
  description = "the key id of external account"
  type        = string
}

variable "eab_hmac" {
  description = "the hmac in base64 of external account"
  type        = string
}

variable "cert_cn" {
  description = "the common name of the certificate"
  type        = string
}

variable "cert_san" {
  description = "the subject alternative names of the certificate"
  type        = list(string)
}
