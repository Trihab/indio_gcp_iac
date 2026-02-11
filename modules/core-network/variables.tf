variable "region-vpc" {
  type        = string
  description = "VPC Region"
  default     = "europe-west9"
}

variable "peer_ip" {
  type = string
  description = "Firewall IP"
  sensitive = true
}

variable "dest_subnet_range" {
  type = string
  description = "On premise subnet range for cloud vpn."
}

variable "shared_secret" {
  type = string
  description = "Tunnel shared secret."
  sensitive = true
}