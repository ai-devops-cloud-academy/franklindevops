module "aks" {
  source = "./modules/aks_stack"

  resource_group_name          = var.resource_group_name
  location                     = var.location
  container_registry_name      = var.container_registry_name
  kubernetes_cluster_name      = var.kubernetes_cluster_name
  log_analytics_workspace_name = var.log_analytics_workspace_name
  application_insights_name    = var.application_insights_name
}
