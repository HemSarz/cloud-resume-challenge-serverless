module "tfaz_oidc_dev" {
  source                   = "../../modules/OIDC"
  for_each                 = toset(var.gh_branches)
  application_display_name = data.azuread_application.tfazspn_gh_oidc.id
  gh_org_name              = var.gh_org_name
  gh_repo_name             = var.gh_repo_name
  audiences                = ["api://AzureADTokenExchange"]
  issuer                   = "https://token.actions.githubusercontent.com"
  subject                  = "repo:${var.gh_org_name}/${var.gh_repo_name}:ref:refs/heads/${each.value}"
}
