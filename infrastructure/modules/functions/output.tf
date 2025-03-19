output "function_app_id" {
  value       = azurerm_linux_function_app.function_app.id
  description = "The ID of the Linux Function App."
}

output "function_app_hostname" {
  value       = azurerm_linux_function_app.function_app.default_hostname
  description = "The default hostname of the Linux Function App."
}

output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "The ID of the storage account"
}

output "service_plan_id" {
  value       = azurerm_service_plan.service_plan.id
  description = "The ID of the service plan"
}

output "identity" {
  value       = azurerm_linux_function_app.function_app.identity
  description = "The identity block of the function app"
}

output "function_app_default_hostname" {
  value = azurerm_function_app.visitor_counter.default_hostname
}
