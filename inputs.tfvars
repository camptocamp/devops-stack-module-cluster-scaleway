# K8s
cluster_name = "devops-stack"
cluster_description = "Devops-stack on cloud provider scaleway"
cluster_tag = ["demo","dev","devops-stack","test"]
kubernetes_version = "1.27.2"
node_pools = {
  config1 = {
  node_type          = "DEV1-M"
  size               = 1
  min_size           = 0
  max_size           = 1
  autoscaling        = true
  autohealing        = true
  container_runtime  = "containerd"
}
}

# Load Balancer 
lb_name = "devops-stack"
zone = "fr-par-1"
lb_type = "LB-S" 
