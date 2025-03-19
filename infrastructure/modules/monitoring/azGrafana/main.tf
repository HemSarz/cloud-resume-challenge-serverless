## ---------------------------------------------------
# Managed Grafana
## ---------------------------------------------------

resource "azurerm_dashboard_grafana" "grafana" {
  name                              = var.grafana_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  grafana_major_version             = var.grafana_major_version
  api_key_enabled                   = var.api_key_enabled
  deterministic_outbound_ip_enabled = var.deterministic_outbound_ip_enabled
  public_network_access_enabled     = var.public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }
}

# Add required role assignment over resource group containing the Azure Monitor Workspace
resource "azurerm_role_assignment" "grafana_monitoring_reader" {
  count                = var.monitoring_reader_role_assignment_enabled ? 1 : 0
  scope                = "subscriptions/${data.azurerm_subscription.current.id}/resourceGroups/${var.resource_group_name}"
  role_definition_name = "Monitoring Reader"
  principal_id         = azurerm_dashboard_grafana.grafana.identity[0].principal_id
}

# Add role assignment to Grafana so an admin user can log in
resource "azurerm_role_assignment" "grafana_admin" {
  count                = var.grafana_admin_role_assignment_enabled && length(var.admin_group_object_ids) > 0 ? 1 : 0
  scope                = azurerm_dashboard_grafana.grafana.id
  role_definition_name = "Grafana Admin"
  principal_id         = var.admin_group_object_ids[0]
}

data "azurerm_subscription" "current" {}
