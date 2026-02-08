resource "google_compute_network" "vpc_network" {
  name = "par-indio-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name = "subnet-1"
  network = google_compute_network.vpc_network.id
  ip_cidr_range = "10.12.0.0/22"
  region = var.region-vpc
}