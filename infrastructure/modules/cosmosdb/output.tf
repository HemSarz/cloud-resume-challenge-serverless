output "cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.cosmosdb.id
}

output "cosmosdb_account_endpoint" {
  value = azurerm_cosmosdb_account.cosmosdb.endpoint
}

output "cosmosdb_primary_master_key" {
  value     = azurerm_cosmosdb_account.cosmosdb.primary_master_key
  sensitive = true
}

output "cosmosdb_database_id" {
  value = azurerm_cosmosdb_sql_database.database.id
}

output "cosmosdb_container_id" {
  value = azurerm_cosmosdb_sql_container.container.id
}
