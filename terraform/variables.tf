variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "container_registry_name" {
  type = string
}
variable "container_registry_sku" {
  type = string
}
variable "kubernetes_cluster_name" {
  type = string
}
variable "kubernetes_version" {
  type = string
}
variable "node_count" {
  type = string
}
variable "node_vm_size" {
  type = string
}
variable "auto_scaling_enabled" {
  type = string
}
variable "aks_admin_username" {
  type = string
}
variable "path_ssh_key" {
  type = string
}
variable "aks_subnet_id" {
  type = string
}
variable "admin_group_object_ids" {
  type = list(string)
}
variable "log_analytics_workspace_name" {
  type = string
}
variable "application_insights_name" {
  type = string
}

variable "aks_admin_group" {
  type = string
}

variable "aks_admin_users" {
  type    = list(string)
  default = ["value"]
}
variable "vnet_name" {
  type = string
}
variable "network_address_space" {
  type = string
}

variable "aks_subnet_address_prefix" {
  type = string
}

variable "aks_subnet_address_name" {
  type = string
}

variable "appgw_subnet_address_prefix" {
  type = string
}

variable "appgw_subnet_address_name" {
  type = string
}
