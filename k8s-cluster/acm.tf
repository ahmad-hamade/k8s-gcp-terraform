resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "acme_registration" "this" {
  account_key_pem = tls_private_key.this.private_key_pem
  email_address   = "test@test.com"
}

# # Missing a domain name.
# # resource "acme_certificate" "_" {
# #  account_key_pem           = "${acme_registration.this.account_key_pem}"
# #  common_name               = "test.com"
# #  subject_alternative_names = ["test.com"]
# #
# #  dns_challenge {
# #    provider = "gcloud"
# #  }
# #}
