# #######################################################
# Proxy input for the particuleio/kapsule/scaleway module
# #######################################################

variable "cluster_name" {
  type        = string
  description = "The name for the Kubernetes cluster"
}

variable "cluster_type" {
  description = "The type of cluster"
  type        = string
  default     = "multicloud"
  validation {
    condition     = contains(["kapsule", "multicloud"], var.cluster_type)
    error_message = "Values can only be \"kapsule\" or \"multicloud\"."
  }
}
variable "cluster_description" {
  type        = string
  description = "A description for the Kubernetes cluster"
  default     = null
}

variable "cluster_tags" {
  type        = list(any)
  default     = []
  description = "The tags associated with the Kubernetes cluster"
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "Tags applied to all ressources."
}

variable "kubernetes_version" {
  default     = "1.24.5"
  type        = string
  description = "The version of the Kubernetes cluster"
}

variable "admission_plugins" {
  type        = list(string)
  default     = []
  description = "The list of admission plugins to enable on the cluster"
}

# ###############################################
# Variable for additional resources/configuration 
# ###############################################
variable "base_domain" {
  description = "A DNS zone if any"
  default     = null
  type        = string
}

variable "lb_type" {
  description = "The type of LB to deploy."
  type        = string
}

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "zone" {
  description = "Zone in the region"
  type        = string
}

variable "node_pools" {
  description = "The node pools to create."
  type        = any
  default     = null
}
