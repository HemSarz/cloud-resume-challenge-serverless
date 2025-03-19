# modules/linux_function_app/main.tf

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "service_plan" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.service_plan_sku
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = var.function_app_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  service_plan_id            = azurerm_service_plan.service_plan.id

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  app_settings = {
    "COSMOS_ENDPOINT"       = var.cosmos_endpoint
    "COSMOS_KEY"            = var.cosmos_key
    "COSMOS_DATABASE_NAME"  = var.cosmos_database_name
    "COSMOS_CONTAINER_NAME" = var.cosmos_container_name
    "FUNCTION_API_URL"      = "https://${azurerm_linux_function_app.function_app.default_hostname}"
  }
  tags = var.tags

}
