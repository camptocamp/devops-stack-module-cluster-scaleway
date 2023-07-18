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

#module "cluster" {
#  source              = "particuleio/kapsule/scaleway"
#  version             = "7.1.0"
#  cluster_name        = var.cluster_name
#  cluster_description = var.cluster_description
#  cluster_tags        = var.cluster_tags
#  kubernetes_version  = var.kubernetes_version
#  admission_plugins   = var.admission_plugins
#  node_pools          = var.node_pools
#}

resource "scaleway_k8s_cluster" "this" {
  type        = "kapsule"
  name        = var.cluster_name
  description = var.cluster_description
  version     = var.kubernetes_version
  cni         = "cilium"
  tags        = var.cluster_tags

  #  autoscaler_config {}
  #  auto_upgrade {}
  #  open_id_connect_config {}

  # feature_gates       = var.feature_gates
  # admission_plugins   = var.admission_plugins
  # apiserver_cert_sans = var.apiserver_cert_sans
  delete_additional_resources = true
}

resource "scaleway_k8s_pool" "this" {
  cluster_id  = scaleway_k8s_cluster.this.id
  name        = "config1"
  node_type   = "DEV1-M"
  size        = 1
  autoscaling = true
  autohealing = true
  min_size    = 1
  max_size    = 1
}

resource "null_resource" "kubeconfig" {
  depends_on = [scaleway_k8s_pool.this]
  triggers = {
    host                   = scaleway_k8s_cluster.this.kubeconfig[0].host
    token                  = scaleway_k8s_cluster.this.kubeconfig[0].token
    cluster_ca_certificate = scaleway_k8s_cluster.this.kubeconfig[0].cluster_ca_certificate
  }
}
