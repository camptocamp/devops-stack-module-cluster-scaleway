# #######################################################
# Proxy input for the particuleio/kapsule/scaleway module
# #######################################################

variable "cluster_name" {
  type        = string
  description = "The name for the Kubernetes cluster"
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

variable "admission_plugins" {
  type        = list(string)
  default     = []
  description = "The list of admission plugins to enable on the cluster"
}

variable "node_pools_defaults" {
  default     = {}
  description = "Default configuration for Kubernetes cluster pools"
  type        = map(any)
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

variable "nodepools" {
  description = "The node pools to create."
  type        = any
  default     = null
}
