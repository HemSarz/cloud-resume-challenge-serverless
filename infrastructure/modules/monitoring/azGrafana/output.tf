output "grafana_id" {
  value       = azurerm_dashboard_grafana.grafana.id
  description = "The ID of the Azure Managed Grafana instance."
}

output "grafana_endpoint" {
  value       = azurerm_dashboard_grafana.grafana.endpoint
  description = "The endpoint of the Azure Managed Grafana instance."
}

output "grafana_url" {
  value       = azurerm_dashboard_grafana.grafana.endpoint
  description = "The URL of the Azure Managed Grafana instance."
}
