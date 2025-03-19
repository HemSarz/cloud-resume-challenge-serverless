# variables.tf

variable "signalr_name" {
  description = "The name of the SignalR service."
  type        = string
}

variable "location" {
  description = "The Azure Region in which the SignalR service should exist."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the SignalR service should exist."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the SignalR service. e.g. Free_F1, Standard_S1"
  type        = string
  default     = "Free_F1"
}

variable "sku_capacity" {
  description = "The SKU capacity of the SignalR service."
  type        = number
  default     = 1
}

variable "allowed_origins" {
  description = "A list of origins which should be allowed to make cross-origin calls (e.g. `[\"http://example.com\"]`)."
  type        = list(string)
  default     = ["*"]
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this SignalR service. Defaults to `true`."
  type        = bool
  default     = true
}

variable "connectivity_logs_enabled" {
  description = "Whether or not connectivity logs are enabled. Defaults to `false`."
  type        = bool
  default     = false
}

variable "messaging_logs_enabled" {
  description = "Whether or not messaging logs are enabled. Defaults to `false`."
  type        = bool
  default     = false
}

variable "service_mode" {
  description = "The service mode of the SignalR service. Possible values are `Classic`, `Default`, `Serverless`."
  type        = string
  default     = "Default"
}

variable "upstream_endpoints" {
  description = "A list of upstream endpoints."
  type = list(object({
    category_pattern = list(string)
    event_pattern    = list(string)
    hub_pattern      = list(string)
    url_template     = string
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the SignalR service."
  type        = map(string)
  default     = {}
}
