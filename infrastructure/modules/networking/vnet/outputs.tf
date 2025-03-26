output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}
output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
