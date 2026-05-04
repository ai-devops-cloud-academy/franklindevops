resource "azurerm_container_registry" "this" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.container_registry_sku
  # public_network_access_enabled = false # only available for Premium SKU
  #retention_policy_in_days      = 60 # only available for Premium SKU

  identity {
    type = "SystemAssigned"
  }

  # encryption {
  #   key_vault_key_id   = data.azurerm_key_vault_key.example.id
  #   identity_client_id = azurerm_user_assigned_identity.example.client_id
  # }

  # lifecycle {
  #   prevent_destroy = true
  # }
}
