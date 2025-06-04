## ---------------------------------------------------
# Resource Group Dev
## ---------------------------------------------------

module "rg" {
  source   = "../../modules/infrares/rg"
  name     = var.resource_group_name
  location = var.location
}


## ---------------------------------------------------
# Storage Account Dev
## ---------------------------------------------------

resource "random_string" "stg_suffix" {
  length  = 4
  special = false
  upper   = false

}
module "stg" {
  source                   = "../../modules/infrares/stg"
  name                     = "${var.storage_account_name}${random_string.stg_suffix.result}"
  location                 = module.rg.location
  resource_group_name      = module.rg.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

## ---------------------------------------------------
# Key Vault Dev
## ---------------------------------------------------

module "kv" {
  source                      = "../../modules/infrares/kv"
  name                        = var.keyvault_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  resource_group_name         = module.rg.resource_group_name
  location                    = var.location
  enabled_for_disk_encryption = false
  purge_protection_enabled    = false
}

## ---------------------------------------------------
# Virtual Network
## ---------------------------------------------------

module "vnet" {
  source              = "../../modules/networking/vnet"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = ["10.0.0.0/16"]
}

## ---------------------------------------------------
# Subnets
## ---------------------------------------------------

module "subnet" {
  source               = "../../modules/networking/subnet"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = module.vnet.vnet_name
  subnets = {
    functions = {
      name           = "functions-subnet"
      address_prefix = "10.0.1.0/24"
    },
    cosmosdb = {
      name           = "cosmosdb-subnet"
      address_prefix = "10.0.2.0/24"
    }
  }
}

## ---------------------------------------------------
# Azure CosmosDB
## ---------------------------------------------------

module "cosmosdb" {
  source                                                = "../../modules/cosmosdb"
  cosmosdb_account_name                                 = var.cosmosdb_account_name
  location                                              = var.location
  resource_group_name                                   = module.rg.resource_group_name
  database_name                                         = var.cosmosdb_database_name
  container_name                                        = var.cosmosdb_container_name
  partition_key_paths                                   = "/id"
  consistency_level                                     = "Session"
  default_consistency_interval_in_seconds               = 10
  default_consistency_max_staleness_interval_in_seconds = 20
}

## ---------------------------------------------------
# Azure Networking - Private DNS
## ---------------------------------------------------

module "cosmosdb_private_dns" {
  source                = "../../modules/networking/privatedns"
  resource_group_name   = module.rg.resource_group_name
  location              = module.rg.location
  private_dns_zone_name = "privatelink.documents.azure.com"
  virtual_network_link = [{
    name               = "cosmosdb-vnet-link"
    virtual_network_id = module.vnet.virtual_network_id
  }]
}

## ---------------------------------------------------
# Azure Networking - Private Endpoints
## ---------------------------------------------------

module "privat_endpoint_cosmosdb" {
  source                = "../../modules/networking/privateendpoint"
  location              = module.rg.location
  resource_group_name   = module.rg.resource_group_name
  private_endpoint_name = "dosmosdb-pe"
  subnet_id             = module.subnet.subnet_ids["cosmosdb"]
  private_service_connection = {
    name                           = "cosmosdb-psc"
    is_manual_connection           = false
    private_connection_resource_id = module.cosmosdb.cosmosdb_account_id
    subresource_names              = ["Sql"]
  }
  private_dns_zone_group = [{
    name                 = "cosmosdb-dns-group"
    private_dns_zone_ids = [module.cosmosdb_private_dns.private_dns_zone_id]
  }]
}

## ---------------------------------------------------
# Azure Functions
## ---------------------------------------------------

module "functions" {
  source                = "../../modules/functions"
  resource_group_name   = module.rg.resource_group_name
  location              = var.location
  storage_account_name  = var.functions_stgName
  function_app_name     = var.function_app_name
  cosmos_container_name = module.cosmosdb.cosmosdb_container_name
  cosmos_database_name  = module.cosmosdb.cosmosdb_database_name
  cosmos_endpoint       = module.cosmosdb.cosmosdb_account_endpoint
  cosmos_key            = module.cosmosdb.cosmosdb_account_primary_master_key
}

## ---------------------------------------------------
# Azure Static Web App
## ---------------------------------------------------

module "azstaticwebapp" {
  source              = "../../modules/staticwebapp"
  name                = "res-static-app"
  location            = module.rg.location
  resource_group_name = module.rg.resource_group_name
  sku_size            = "Free"
  sku_tier            = "Free"
}
