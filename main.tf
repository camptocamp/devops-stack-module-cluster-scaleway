resource "scaleway_lb_ip" "this" {}

resource "scaleway_lb" "this" {
  zone  = var.zone
  ip_id = scaleway_lb_ip.this.id
  type  = var.lb_type
  tags  = var.cluster_tags
}

module "kapsule" {
  source              = "particuleio/kapsule/scaleway"
  version             = "7.1.0"
  cluster_name        = var.cluster_name
  cluster_description = var.cluster_description
  cluster_tags        = var.cluster_tags
  tags                = var.tags
  admission_plugins   = var.admission_plugins
  node_pools          = var.nodepools
}
