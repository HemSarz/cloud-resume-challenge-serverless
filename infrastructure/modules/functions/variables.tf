variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the resources."
}

variable "location" {
  type        = string
  description = "The Azure Region in which to create the resources."
  default     = "norwayeast"
  validation {
    condition = contains([
      "westeurope",
      "northeurope",
      "norwayeast"
    ], lower(var.location))
    error_message = "Invalid Azure Region. Please choose from westeurope, northeurope, or norwayeast."
  }
}

variable "storage_account_name" {
  type        = string
  description = "The name of the Storage Account."
  default     = "linuxfunctionappsa"
}

variable "service_plan_name" {
  type        = string
  description = "The name of the App Service Plan."
  default     = "example-app-service-plan"
}

variable "service_plan_sku" {
  type        = string
  description = "The SKU of the App Service Plan."
  default     = "B1"
}

variable "function_app_name" {
  type        = string
  description = "The name of the Linux Function App."
  default     = "example-linux-function-app"
}

variable "app_settings" {
  type        = map(string)
  description = "A map of app settings to apply to the Function App."
  default     = {}
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  description = "An identity block as defined below."
  default     = null
}

variable "https_only" {
  type        = bool
  description = "Should only HTTPS traffic be allowed?"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Linux Function App."
  default     = {}
}

variable "cosmos_endpoint" {}
variable "cosmos_key" {}
variable "cosmos_database_name" {}
variable "cosmos_container_name" {}
