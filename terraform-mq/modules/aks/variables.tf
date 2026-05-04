variable "prefix" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "aks_dns_prefix" {
  type = string
}
variable "aks_dns_prefix_private" {
  type = string
}
variable "kubernetes_version" {
  type    = string
  default = "1.22"
}
variable "cost_analysis_enabled" {
  type    = bool
  default = false
}
variable "disk_encryption_set_id" {
  type    = string
  default = null
}
variable "private_cluster_enabled" {
  type    = bool
  default = true
}
variable "private_dns_zone_id" {
  type = string
  default = null
}

# default_node_pool
variable "default_node_pool" {
  type = object({
    name                        = string
    node_count                  = number
    vm_size                     = string
    auto_scaling_enabled        = bool
    host_encryption_enabled     = bool
    os_disk_size_gb             = number
    os_sku                      = string
    temporary_name_for_rotation = string
    max_count                   = number
    min_count                   = number
  })
  default = null
}

# azure_active_directory_role_based_access_control
variable "aad_rbac" {
  type = object({
    tenant_id              = string
    admin_group_object_ids = list(string)
    azure_rbac_enabled     = bool
  })
  default = null
}

# ingress_application_gateway
variable "ingress_application_gateway" {
  type = object({
    gateway_id   = optional(string)
    gateway_name = optional(string)
    subnet_id    = string
  })
  default = null
}

# oms_agent
variable "omsagent_law_id" {
  type    = string
  default = null
}

# microsoft_defender
variable "md_law_id" {
  type    = string
  default = null
}

# network_profile
variable "network_profile" {
  type = object({
    network_plugin    = string
    network_policy    = string
    outbound_type     = string
    load_balancer_sku = string
  })
  default = null
}

## Role Assigment
variable "role_assigment_scope" {
  type = string
  default = null
}