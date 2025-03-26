data "azurerm_client_config" "current" {}
data "azuread_application" "tfazspn_gh_oidc" {
  display_name = "tfazspn"
}
