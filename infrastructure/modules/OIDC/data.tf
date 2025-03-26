data "azurerm_client_config" "current" {

}

data "azuread_application" "tfazapp" {
  display_name = var.application_display_name
}
