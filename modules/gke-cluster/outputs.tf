output "endpoint_gke" {
  value = google_container_cluster.argocd_manager.endpoint
}