data "google_compute_network" "my_vpc" {
  name    = "par-indio-vpc"
  project = var.project_id
}

data "google_compute_subnetwork" "my_subnet" {
  name    = "subnet-1"
  region  = var.region-cluster
  project = var.project_id
}