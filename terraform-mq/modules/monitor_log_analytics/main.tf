resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.prefix}-law"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.law_sku
  retention_in_days   = var.law_retention_days

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_log_analytics_solution" "this" {
  solution_name         = "ContainerInsights"
  resource_group_name   = var.resource_group_name
  location              = var.location
  workspace_resource_id = azurerm_log_analytics_workspace.this.id
  workspace_name        = azurerm_log_analytics_workspace.this.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
