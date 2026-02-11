variable "region" {
  type        = string
  description = "Deployment region."
  default     = "europe-west9"
}

variable "project_id" {
  type        = string
  description = "ID of GCP Project."
}

variable "vpn_peer_ip" {
  type = string
  description = "Firewall IP"
  sensitive = true
}

variable "vpn_dest_subnet_range" {
  type = string
  description = "On premise subnet range for cloud vpn."
}

variable "vpn_shared_secret" {
  type = string
  description = "Tunnel shared secret."
  sensitive = true
}