## ---------------------------------------------------
# Key Vault
## ---------------------------------------------------

resource "azurerm_key_vault" "kv" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = "standard"

}
