output "endpoint" {
  value = google_container_cluster.this.endpoint
}

output "instance_group_urls" {
  value = google_container_cluster.this.instance_group_urls
}

output "node_config" {
  value = google_container_cluster.this.node_config
}

output "node_pools" {
  value = google_container_cluster.this.node_pool
}
