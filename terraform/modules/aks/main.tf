resource "azurerm_kubernetes_cluster" "this" {
  name                = var.kubernetes_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aksdemoytb"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                        = "default"
    node_count                  = var.node_count
    vm_size                     = var.node_vm_size #"standard_a2_v2"
    vnet_subnet_id              = var.aks_subnet_id
    auto_scaling_enabled        = var.auto_scaling_enabled
    temporary_name_for_rotation = "nodetemp"
    type                        = "VirtualMachineScaleSets"
  }

  ingress_application_gateway {
    subnet_id = var.appgw_subnet_id
  }

  linux_profile {
    admin_username = var.aks_admin_username
    ssh_key {
      key_data = file(var.path_ssh_key)
    }
  }

  identity {
    type = "SystemAssigned"
  }

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.admin_group_object_ids
    azure_rbac_enabled     = true
  }
}
