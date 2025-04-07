module "tfaz_oidc_dev" {
  source         = "../../../modules/OIDC"
  for_each       = toset(var.gh_branches)
  application_id = data.azuread_application.tfazspn.id
  display_name   = local.display_names[each.key]
  gh_org_name    = var.gh_org_name
  gh_repo_name   = var.gh_repo_name
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:${var.gh_org_name}/${var.gh_repo_name}:ref:refs/heads/${each.key}"
}

locals {
  display_names = { for b in var.gh_branches : b => "${var.var.display_name}-${b}" }
}
