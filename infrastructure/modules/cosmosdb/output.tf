output "cosmosdb_account_id" {
  value       = azurerm_cosmosdb_account.cosmosdbacc.id
  description = "The ID of the Cosmos DB account."
}

output "cosmosdb_sql_database_id" {
  value       = azurerm_cosmosdb_sql_database.csmosdatabase.id
  description = "The ID of the Cosmos DB SQL database."
}

output "cosmosdb_sql_container_id" {
  value       = azurerm_cosmosdb_sql_container.cosmoscontainer.id
  description = "The ID of the cosmos container"
}

output "cosmosdb_account_endpoint" {
  value       = azurerm_cosmosdb_account.cosmosdbacc.endpoint
  description = "The endpoint of the Cosmos DB account."
}

output "cosmosdb_account_primary_master_key" {
  value       = azurerm_cosmosdb_account.cosmosdbacc.primary_key
  sensitive   = true
  description = "The primary master key of the Cosmos DB account."
}

output "cosmosdb_container_name" {
  value       = azurerm_cosmosdb_sql_container.cosmoscontainer.name
  description = "The name of the cosmos container"
}
output "cosmosdb_database_name" {
  value       = azurerm_cosmosdb_sql_database.csmosdatabase.name
  description = "The name of the cosmos database"
}
