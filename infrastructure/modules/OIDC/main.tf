resource "azuread_application_federated_identity_credential" "branches" {
  for_each       = toset(var.gh_branches)
  application_id = data.azuread_application.tfazspn.id
  display_name   = "${var.prefix}-${var.fic_display_name_branch}-${each.value}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:${var.gh_org_name}/${var.gh_repo_name}:ref:refs/heads/${each.value}"
}
