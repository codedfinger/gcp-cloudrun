resource "google_compute_global_address" "lb_ip" {
  name = "lb-ip"
}

resource "google_compute_ssl_certificate" "lb_cert" {
  name        = "ssl-cert"
  private_key = file(var.ssl_private_key)
  certificate = file(var.ssl_certificate)
}

resource "google_compute_target_https_proxy" "https_proxy" {
  name             = "https-proxy"
  ssl_certificates = [google_compute_ssl_certificate.lb_cert.id]
  url_map          = google_compute_url_map.lb_url_map.id
}

resource "google_compute_global_forwarding_rule" "https_forwarding_rule" {
  name       = "https-forwarding-rule"
  target     = google_compute_target_https_proxy.https_proxy.id
  port_range = "443"
  ip_address = google_compute_global_address.lb_ip.address
}
