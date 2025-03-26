output "key_vault_id" {
  value = azurerm_key_vault.tfaz_kv.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.tfaz_kv.vault_uri
}
