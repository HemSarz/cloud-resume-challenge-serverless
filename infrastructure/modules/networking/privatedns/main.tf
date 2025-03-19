resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  for_each              = { for link in var.virtual_network_link : link.name => link }
  name                  = each.value.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  virtual_network_id    = each.value.virtual_network_id
  resource_group_name   = var.resource_group_name
}
