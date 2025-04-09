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
# variable "identity_type" {
#   type        = string
#   description = "The type of identity to assign to the Static Web App. Possible values are 'SystemAssigned' (default) or 'UserAssigned'."
#   default     = "SystemAssigned"
# }

variable "sku_tier" {
  type        = string
  description = "The pricing tier for the Static Web App. Defaults to 'Free'."
  default     = "Free"
}

variable "sku_size" {
  type        = string
  description = "The pricing tier size for the Static Web App. Defaults to 'Free'."
  default     = "Free"
}
