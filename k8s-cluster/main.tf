resource "google_container_cluster" "this" {
  name = var.cluster_name
  initial_node_count = var.node_count

  node_config {
    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      type = "apps"
    }

    tags = ["name", "ahamade"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
