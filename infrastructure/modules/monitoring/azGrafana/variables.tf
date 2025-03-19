variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Azure Managed Grafana."
}

variable "location" {
  type        = string
  description = "The Azure region where the Azure Managed Grafana should be created."
}

variable "grafana_name" {
  type        = string
  description = "The name of the Azure Managed Grafana."
}

variable "grafana_major_version" {
  type        = string
  description = "The major version of Grafana."
  default     = null
}

variable "api_key_enabled" {
  description = "Controls whether API key authentication is enabled. Valid values are 'true' or 'false'. If set to 'true', API key authentication will be required for access."
  type        = bool
  default     = false
}

variable "deterministic_outbound_ip_enabled" {
  description = "Controls whether a deterministic outbound IP address is enabled. Valid values are 'true' or 'false'. When 'true', a static outbound IP is used, which is useful for whitelisting."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Controls whether public network access is enabled. Valid values are 'true' or 'false'. If 'false', access will be restricted to private endpoints or virtual networks."
  type        = bool
  default     = true
}

variable "monitoring_reader_role_assignment_enabled" {
  description = "Controls whether to create the Monitoring Reader role assignment on the resource group."
  type        = bool
  default     = true
}

variable "grafana_admin_role_assignment_enabled" {
  description = "Controls whether to create the Grafana Admin role assignment."
  type        = bool
  default     = true
}

variable "admin_group_object_ids" {
  description = "A list of Azure AD group object IDs that should be granted Grafana Admin role."
  type        = list(string)
  default     = []
}
