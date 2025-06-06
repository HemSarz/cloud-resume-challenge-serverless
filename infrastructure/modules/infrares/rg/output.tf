output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  description = "The location of the resource group."
  value       = azurerm_resource_group.rg.location
}
