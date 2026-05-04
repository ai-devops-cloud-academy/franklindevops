variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
# Container Registry variables
variable "container_registry_name" {
  type    = string
  default = "default"
}
variable "container_registry_sku" {
  type    = string
  default = "Basic"
}
