locals {
  base_domain = coalesce(var.base_domain, format("%s.nip.io", replace(scaleway_lb_ip.this.ip_address, ".", "-")))
}
