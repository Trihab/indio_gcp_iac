resource "google_compute_vpn_tunnel" "on_prem_tunnel" {
  name                    = "on-prem-tunnel-1"
  peer_ip                 = var.peer_ip
  shared_secret           = var.shared_secret
  local_traffic_selector  = [google_compute_subnetwork.vpc_subnetwork.ip_cidr_range]
  remote_traffic_selector = [var.dest_subnet_range]

  target_vpn_gateway = google_compute_vpn_gateway.vpn_gateway.id

  depends_on = [
    google_compute_forwarding_rule.fr_esp,
    google_compute_forwarding_rule.fr_udp500,
    google_compute_forwarding_rule.fr_udp4500,
  ]

  labels = {
    tag = "vpn"
  }
}

resource "google_compute_vpn_gateway" "vpn_gateway" {
  name    = "vpn-gw"
  network = google_compute_network.vpc_network.id
}

resource "google_compute_address" "vpn_static_ip" {
  name = "vpn-static-ip"
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  ip_protocol = "ESP"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.id
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "fr-udp500"
  ip_protocol = "UDP"
  port_range  = "500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.id
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "fr-udp4500"
  ip_protocol = "UDP"
  port_range  = "4500"
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.id
}

resource "google_compute_route" "route_on_prem" {
  name       = "route1-vpn-on-prem"
  network    = google_compute_network.vpc_network.name
  dest_range = var.dest_subnet_range
  priority   = 1000

  next_hop_vpn_tunnel = google_compute_vpn_tunnel.on_prem_tunnel.id
}