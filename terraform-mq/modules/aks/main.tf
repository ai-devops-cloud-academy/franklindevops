resource "azurerm_kubernetes_cluster" "this" {
  # Required
  name                       = "${var.prefix}-aks-cluster"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  dns_prefix                 = var.aks_dns_prefix
  dns_prefix_private_cluster = var.aks_dns_prefix_private
  kubernetes_version         = var.kubernetes_version
  cost_analysis_enabled      = var.cost_analysis_enabled
  disk_encryption_set_id     = var.disk_encryption_set_id
  private_cluster_enabled    = var.private_cluster_enabled
  private_dns_zone_id        = var.private_dns_zone_id

  default_node_pool {
    name                        = var.default_node_pool.name
    node_count                  = var.default_node_pool.node_count
    vm_size                     = var.default_node_pool.vm_size
    auto_scaling_enabled        = var.default_node_pool.auto_scaling_enabled
    host_encryption_enabled     = var.default_node_pool.host_encryption_enabled
    os_disk_size_gb             = var.default_node_pool.os_disk_size_gb
    os_sku                      = var.default_node_pool.os_sku
    temporary_name_for_rotation = var.default_node_pool.temporary_name_for_rotation
    type                        = "VirtualMachineScaleSets"
    max_count                   = var.default_node_pool.max_count
    min_count                   = var.default_node_pool.min_count
  }

  azure_active_directory_role_based_access_control {
    tenant_id              = try(var.aad_rbac.tenant_id, null)
    admin_group_object_ids = try(var.aad_rbac.admin_group_object_ids, [])
    azure_rbac_enabled     = try(var.aad_rbac.azure_rbac_enabled, false)
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.this.id]
  }

  ingress_application_gateway {
    gateway_name = try(var.ingress_application_gateway.gateway_name, null)
    gateway_id   = try(var.ingress_application_gateway.gateway_id, null)
    subnet_id    = var.ingress_application_gateway.subnet_id
  }

  oms_agent {
    log_analytics_workspace_id = var.omsagent_law_id
  }

  microsoft_defender {
    log_analytics_workspace_id = var.md_law_id
  }

  network_profile {
    network_plugin    = try(var.network_profile.network_plugin, null)
    network_policy    = try(var.network_profile.network_policy, null)
    outbound_type     = try(var.network_profile.outbound_type, null)
    load_balancer_sku = try(var.network_profile.load_balancer_sku, null)
  }
}

resource "azurerm_user_assigned_identity" "this" {
  name                = "aks-uami"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_role_assignment" "this" {
  scope                = var.role_assigment_scope
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

