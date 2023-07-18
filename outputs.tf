output "base_domain" {
  value = local.base_domain
}

output "lb_ip_address" {
  value = scaleway_lb_ip.this.ip_address
}

output "lb_id" {
  value = scaleway_lb.this.id
}

output "kubeconfig" {
  value = {
    host                   = null_resource.kubeconfig.triggers.host
    token                  = null_resource.kubeconfig.triggers.token
    cluster_ca_certificate = base64decode(null_resource.kubeconfig.triggers.cluster_ca_certificate)
  }
}

output "kubeconfig_file" {
  value     = scaleway_k8s_cluster.this.kubeconfig.0.config_file
  sensitive = true
}

#output "node_pools" {
#  value = scaleway_k8s_cluster.this
#}
