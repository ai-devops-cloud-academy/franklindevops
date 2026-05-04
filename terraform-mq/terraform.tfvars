# Resource group variables
location            = "canadacentral"
resource_group_name = "rg-dod-poc-cicd-cac-001"
tags = {
  Projet             = "Poc-Dod-Cicd-Cac"
  Confidentialite    = "Moyen"
  CriticiteRessource = "Élevée"
  Disponibilite      = "Élevée"
  Environnement      = "Production"
  Integrite          = "Faible"
  NomDuSysteme       = "Zone d'accueil eduqc"
  ResponsableTI      = "Infrastructure"
}
prefix = "dod-poc"

# Container Registry variables
container_registry_name = "acrdodpoccicdcan001"
container_registry_sku  = "Basic"

# Monitor, log analytic workspace
law_sku            = "PerGB2018"
law_retention_days = 90

# Network
vnet_address_space = ["10.0.0.0/16"]
aks_subnet_cidr    = ["10.0.1.0/24"]
appgw_subnet_cidr  = ["10.0.2.0/24"]

# AKS
aks_dns_prefix = null
aks_dns_prefix_private = "aksdodpoc-privdns"
kubernetes_version    = "1.35"
cost_analysis_enabled = false
#disk_encryption_set_id = "value"
private_cluster_enabled = true
default_node_pool = {
  name                        = "default"
  node_count                  = 2
  vm_size                     = "Standard_DS2_v2"
  auto_scaling_enabled        = false
  host_encryption_enabled     = false
  os_disk_size_gb             = 50
  os_sku                      = "Ubuntu2404"
  temporary_name_for_rotation = "akstemp"
  max_count                   = null
  min_count                   = null
}

aad_rbac = {
  tenant_id              = "00000000-0000-0000-0000-000000000000"
  admin_group_object_ids = ["11111111-1111-1111-1111-111111111111"]
  azure_rbac_enabled     = true
}

# ingress_application_gateway = {
#   gateway_name = "aksappgw"
# }

network_profile = {
  network_plugin    = "azure"
  network_policy    = "azure"
  outbound_type     = "managedNATGateway"
  load_balancer_sku = "standard"
}

# AKS Group
aks_admin_group = "aks-admin-group"
aks_admin_users = ["admaz_fokfr11@eduqc.onmicrosoft.com"]

