## ---------------------------------------------------
# Key Vault Secrets
## ---------------------------------------------------

resource "azurerm_key_vault_secret" "secret" {
  for_each     = toset(var.secret_names)
  name         = each.key
  key_vault_id = var.key_vault_id
  value        = var.secret_values[each.key] # Add value input, mapped by secret name
}
