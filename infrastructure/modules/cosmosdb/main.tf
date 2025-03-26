resource "azurerm_cosmosdb_account" "cosmosdbacc" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.default_consistency_interval_in_seconds
    max_staleness_prefix    = var.default_consistency_max_staleness_interval_in_seconds
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "csmosdatabase" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmosdbacc.name
}

resource "azurerm_cosmosdb_sql_container" "cosmoscontainer" {
  name                  = var.container_name
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdbacc.name
  database_name         = azurerm_cosmosdb_sql_database.csmosdatabase.name
  partition_key_paths   = [var.partition_key_paths]
  partition_key_version = 2
}
