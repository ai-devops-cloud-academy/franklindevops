resource "azuread_group" "this" {
  display_name     = var.aks_admin_group
  security_enabled = true
}
data "azuread_user" "this" {
  for_each = toset(var.aks_admin_users)

  user_principal_name = each.value
}
resource "azuread_group_member" "this" {
  for_each = data.azuread_user.this

  group_object_id  = azuread_group.this.object_id
  member_object_id = each.value.object_id
}