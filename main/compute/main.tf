module "gke-cluster" {
  source         = "../../modules/gke-cluster"
  project_id     = var.project_id
  region-cluster = var.region
}