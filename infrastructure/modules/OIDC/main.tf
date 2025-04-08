resource "azuread_application_federated_identity_credential" "branches" {
  application_id = data.azuread_application.tfazspn.id
  display_name   = var.display_name
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = var.subject
}
