resource "azurerm_static_site" "static_web_app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier            = "Free"
  sku_size            = "Free"

  identity {
    type = "SystemAssigned"
  }

}
