module "rg" {
  source = "./modules/rg"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet" {
  source = "./modules/vnet"

  resource_group_name         = module.rg.resource_group_name
  location                    = module.rg.resource_group_location
  vnet_name                   = var.vnet_name
  network_address_space       = var.network_address_space
  aks_subnet_address_name     = var.aks_subnet_address_name
  aks_subnet_address_prefix   = var.aks_subnet_address_prefix
  appgw_subnet_address_name   = var.appgw_subnet_address_name
  appgw_subnet_address_prefix = var.appgw_subnet_address_prefix
}

module "acr" {
  source = "./modules/acr"

  container_registry_name = var.container_registry_name
  resource_group_name     = module.rg.resource_group_name
  location                = module.rg.resource_group_location
  container_registry_sku  = var.container_registry_sku
}

module "loganalytics" {
  source = "./modules/log_analytics"

  resource_group_name          = module.rg.resource_group_name
  location                     = module.rg.resource_group_location
  log_analytics_workspace_name = var.log_analytics_workspace_name
  application_insights_name    = var.application_insights_name
}

module "azuread" {
  source = "./modules/azuread"

  aks_admin_group = var.aks_admin_group
  aks_admin_users = var.aks_admin_users
}

module "aks" {
  depends_on = [module.azuread]
  source     = "./modules/aks"

  resource_group_name     = module.rg.resource_group_name
  location                = module.rg.resource_group_location
  kubernetes_cluster_name = var.kubernetes_cluster_name
  kubernetes_version      = var.kubernetes_version
  node_count              = var.node_count
  node_vm_size            = var.node_vm_size
  auto_scaling_enabled    = var.auto_scaling_enabled
  aks_admin_username      = var.aks_admin_username
  path_ssh_key            = var.path_ssh_key
  aks_subnet_id           = module.vnet.aks_subnet_id
  appgw_subnet_id         = module.vnet.appgw_subnet_id
  admin_group_object_ids  = module.azuread.admin_group_object_ids
}
