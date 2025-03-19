output "static_web_app_id" {
  value = azurerm_static_web_app.static_web_app.id
}

output "static_web_app_hostname" {
  value = azurerm_static_web_app.static_web_app.default_hostname
}

output "static_web_app_identity" {
  value = azurerm_static_web_app.static_web_app.identity
}       
