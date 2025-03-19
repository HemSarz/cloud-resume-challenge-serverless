## ---------------------------------------------------
# Managed Prometheus
## ---------------------------------------------------

resource "azurerm_monitor_workspace" "azpws" {
  name                = "${var.name}-${var.module_name_prefix}-${var.location}"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_monitor_data_collection_endpoint" "dce" {
  name                          = "dce-${var.module_name_prefix}-${var.location}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  public_network_access_enabled = var.public_network_access_enabled
  kind                          = "Linux"
}

resource "azurerm_monitor_data_collection_rule" "dcr" {
  name                        = "dcr-${var.module_name_prefix}-${var.location}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.dce.id
  kind                        = "Linux"

  destinations {
    monitor_account {
      monitor_account_id = azurerm_monitor_data_collection_endpoint.azpws.id
      name               = "MonitoringAccount1"
    }
  }

  data_flow {
    streams      = ["Microsoft-AzureFunctionAppLogs"]
    destinations = ["MonitoringAccount1"]
  }

  data_sources {
    prometheus_forwarder {
      streams = ["Microsoft-PrometheusMetrics"]
      name    = "PrometheusDataSource"
    }
  }

  description = "DCR for Azure Monitor Metrics Profile (Serverless)"

  depends_on = [
    azurerm_monitor_data_collection_endpoint.dce
  ]
}
