module "core-network" {
  source = "../../modules/core-network"
  region-vpc = var.region
  peer_ip = var.vpn_peer_ip
  dest_subnet_range = var.vpn_dest_subnet_range
  shared_secret = var.vpn_shared_secret
}