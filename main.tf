resource "scaleway_lb_ip" "this" {
  zone = var.zone
}

resource "scaleway_lb" "this" {
  name  = var.lb_name
  zone  = var.zone
  tags  = var.cluster_tags
  ip_id = scaleway_lb_ip.this.id
  type  = var.lb_type
}

module "cluster" {
  source              = "particuleio/kapsule/scaleway"
  version             = "7.1.1"
  cluster_name        = var.cluster_name
  cluster_type        = var.cluster_type
  cluster_description = var.cluster_description
  cluster_tags        = var.cluster_tags
  kubernetes_version  = var.kubernetes_version
  admission_plugins   = var.admission_plugins
  node_pools          = var.node_pools
}
