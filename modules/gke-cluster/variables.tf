variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "region-cluster" {
  type        = string
  description = "GKE Region"
  default     = "europe-west9"
}