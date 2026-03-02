resource "google_compute_network" "vpc_network" {
  name                    = "par-indio-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = "gke-autopilot-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.12.0.0/22"
  region        = var.region-vpc

  secondary_ip_range {
    range_name    = "gke-pods-range"
    ip_cidr_range = "10.10.0.0/20"
  }

  secondary_ip_range {
    range_name    = "gke-services-range"
    ip_cidr_range = "10.20.0.0/24"
  }

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