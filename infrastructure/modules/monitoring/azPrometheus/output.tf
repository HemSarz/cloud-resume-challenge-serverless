output "data_collection_endpoint_id" {
  value       = azurerm_monitor_data_collection_endpoint.dce.id
  description = "ID of the data collection endpoint"
}

output "data_collection_rule_id" {
  value       = azurerm_monitor_data_collection_rule.dcr.id
  description = "ID of the data collection rule"
}
