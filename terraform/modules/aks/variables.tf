variable "resource_group_name" {
  type = string
}
variable "location" {
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
variable "appgw_subnet_id" {
  type = string
}
variable "admin_group_object_ids" {
  type = list(string)
}
