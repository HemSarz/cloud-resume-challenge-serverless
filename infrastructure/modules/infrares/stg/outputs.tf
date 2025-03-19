output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.stg.id
}

output "storage_account_primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account."
  value       = azurerm_storage_account.stg.primary_blob_endpoint
}

output "storage_account_primary_access_key" {
  description = "The primary access key of the storage account."
  value       = azurerm_storage_account.stg.primary_access_key
  sensitive   = true #Marks the value as sensitive, preventing it from being displayed in plaintext
}
