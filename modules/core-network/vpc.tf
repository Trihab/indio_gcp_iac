resource "google_compute_network" "vpc_network" {
  name                    = "par-indio-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "subnet-1"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.12.0.0/22"
  region        = var.region-vpc
}

resource "google_compute_firewall" "vpc_fw_rule" {
  project     = var.project_id
  name        = "allow-essential-vpc"
  network     = google_compute_network.vpc_network.id
  description = "Creates firewall rule targeting tagged instances"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  target_tags = ["net-vm"]
}