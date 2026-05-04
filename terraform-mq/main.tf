module "rg" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}
module "acr" {
  source = "./modules/acr"

  location                = module.rg.rg_location
  resource_group_name     = module.rg.rg_name
  container_registry_name = var.container_registry_name
  container_registry_sku  = var.container_registry_sku
}
module "monitor" {
  source = "./modules/monitor_log_analytics"

  prefix              = var.prefix
  location            = module.rg.rg_location
  resource_group_name = module.rg.rg_name
  law_sku             = var.law_sku
  law_retention_days  = var.law_retention_days
}
module "vnet" {
  source = "./modules/network"

  prefix              = var.prefix
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location
  vnet_address_space  = var.vnet_address_space
  aks_subnet_cidr     = var.aks_subnet_cidr
  appgw_subnet_cidr   = var.appgw_subnet_cidr
}

# module "ad" {
#   source = "./modules/azuread"

#   aks_admin_group = var.aks_admin_group
#   aks_admin_users = var.aks_admin_users
# }

module "aks" {
  depends_on = [module.acr, module.vnet]
  source     = "./modules/aks"

  prefix                  = var.prefix
  resource_group_name     = module.rg.rg_name
  location                = var.location
  aks_dns_prefix          = try(var.aks_dns_prefix, null)
  aks_dns_prefix_private  = try(var.aks_dns_prefix_private, null)
  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = module.vnet.priv_dnszone_id
  kubernetes_version      = var.kubernetes_version
  cost_analysis_enabled   = var.cost_analysis_enabled
  disk_encryption_set_id  = var.disk_encryption_set_id
  default_node_pool       = var.default_node_pool
  aad_rbac                = var.aad_rbac
  #ingress_application_gateway = var.ingress_application_gateway
  ingress_application_gateway = local.ingress_application_gateway
  omsagent_law_id             = module.monitor.law_id
  md_law_id                   = module.monitor.law_id
  network_profile             = var.network_profile
  role_assigment_scope        = module.vnet.priv_dnszone_id
}

locals {
  ingress_application_gateway = {
    gateway_name = "aksappgw"
    subnet_id    = module.vnet.appgw_subnet_id
  }
}
