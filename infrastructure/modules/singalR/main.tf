resource "azurerm_signalr_service" "signalr" {
  name                = var.signalr_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }

  cors {
    allowed_origins = var.allowed_origins
  }

  public_network_access_enabled = var.public_network_access_enabled

  connectivity_logs_enabled = var.connectivity_logs_enabled
  messaging_logs_enabled    = var.messaging_logs_enabled
  service_mode              = var.service_mode

  dynamic "upstream_endpoint" {
    for_each = var.upstream_endpoints
    content {
      category_pattern = upstream_endpoint.value.category_pattern
      event_pattern    = upstream_endpoint.value.event_pattern
      hub_pattern      = upstream_endpoint.value.hub_pattern
      url_template     = upstream_endpoint.value.url_template
    }
  }

  tags = var.tags
}
