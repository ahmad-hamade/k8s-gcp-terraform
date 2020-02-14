provider "google" {
  credentials = file("../credentials.json")
  project     = "test"
  region      = "europe-west1"
  zone        = "europe-west1-d"
}

provider "kubernetes" {
  host                   = google_container_cluster.this.endpoint
  token                  = data.google_client_config.this.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.this.master_auth.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    load_config_file = false

    host                   = google_container_cluster.this.endpoint
    token                  = data.google_client_config.this.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.this.master_auth.0.cluster_ca_certificate)
  }
}

# Chagne URLs to the production endpoints:
# https://letsencrypt.org/docs/acme-protocol-updates/
provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}