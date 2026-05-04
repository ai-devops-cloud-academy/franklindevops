output "aks_vnet_id" {
  value = azurerm_virtual_network.this.id
}
output "aks_vnet_name" {
  value = azurerm_virtual_network.this.name
}
output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}
output "appgw_subnet_id" {
  value = azurerm_subnet.appgw_subnet.id
}

output "priv_dnszone_id" {
  value = azurerm_private_dns_zone.this.id
}