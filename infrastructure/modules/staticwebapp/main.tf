
resource "azurerm_static_web_app" "static_web_app" {
  name                = var.static_web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
