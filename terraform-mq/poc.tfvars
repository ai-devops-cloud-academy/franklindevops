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
#aks_dns_prefix = "value"
kubernetes_version    = "1.32"
cost_analysis_enabled = false
#disk_encryption_set_id = "value"
dnp_name                    = "default"
dnp_node_count              = 2
dnp_vm_size                 = "Standard_D2_v2"
dnp_auto_scaling_enabled    = false
dnp_host_encryption_enabled = false
dnp_os_disk_size_gb         = 50
dnp_os_sku                  = "Ubuntu2404"
dnp_max_count               = 4
dnp_min_count               = 2
iag_gateway_name            = "aks-appgw"

# AKS Group
aks_admin_group = "aks-admin-group"
aks_admin_users = ["admaz_fokfr11@eduqc.onmicrosoft.com"]

