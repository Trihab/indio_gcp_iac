resource "google_container_cluster" "argocd_manager" {
  name     = "autopilot-cluster-1"
  location = var.region-cluster

  enable_autopilot    = true
  deletion_protection = false

  network    = data.google_compute_network.my_vpc.id
  subnetwork = data.google_compute_subnetwork.my_subnet.id

  release_channel {
    channel = "STABLE"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-pods-range"
    services_secondary_range_name = "gke-services-range"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "194.11.255.187/32"
      display_name = "AllowedNet"
    }
  }
}