variable "aks_admin_group" {
  type = string
}
variable "aks_admin_users" {
  type    = list(string)
  default = ["value"]
}
