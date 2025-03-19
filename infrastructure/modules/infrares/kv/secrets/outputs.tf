output "key_vault_secret_ids" {
  description = "A map of secret names to secret IDs."
  value       = { for name, secret in azurerm_key_vault_secret.example : name => secret.id }
}

output "key_vault_secret_versions" {
  description = "A map of secret names to secret versions."
  value       = { for name, secret in azurerm_key_vault_secret.example : name => secret.version }
}
