resource "google_container_cluster" "argocd_manager" {
  name     = "argocd-control-plane"
  location = var.region-cluster

  enable_autopilot = true

  deletion_protection = false

  network    = data.google_compute_network.my_vpc.id
  subnetwork = data.google_compute_subnetwork.my_subnet.id

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "192.168.1.0/24"
      display_name = "AllowedNet"
    }
  }
}