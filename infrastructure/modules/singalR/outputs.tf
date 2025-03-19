# outputs.tf

output "signalr_id" {
  description = "The ID of the SignalR service."
  value       = azurerm_signalr_service.signalr.id
}

output "signalr_hostnames" {
  description = "The hostnames of the SignalR service."
  value       = azurerm_signalr_service.signalr.hostnames
}

output "signalr_primary_access_key" {
  description = "The primary access key of the SignalR service."
  value       = azurerm_signalr_service.signalr.primary_access_key
  sensitive   = true
}

output "signalr_secondary_access_key" {
  description = "The secondary access key of the SignalR service."
  value       = azurerm_signalr_service.signalr.secondary_access_key
  sensitive   = true
}
