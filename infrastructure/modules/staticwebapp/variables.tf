variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Static Web App."
}

variable "name" {
  type        = string
  description = "The name of the Static Web App."
}

variable "location" {
  type        = string
  description = "The Azure region where the Static Web App should be created."
}

variable "sku_name" {
  type        = string
  description = "The SKU name of the Static Web App."
  default     = "Free"
}
variable "identity_type" {
  type        = string
  description = "the type of managed identity to assign to this static web app."
  default     = "SystemAssigned"
}
