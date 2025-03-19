variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "name" {
  type        = string
  description = "The name of the workspace"
}

variable "location" {
  type        = string
  description = "The Azure region where resources should be created."
  default     = "norwayeast"
  validation {
    condition = contains([
      "westeurope",
      "northeurope",
      "norwayeast"
    ], lower(self))
    error_message = "Invalid region selected. Choose from westeurope, northeurope, or norwayeast."
  }
}

variable "workspace_id" {
  type        = string
  description = "The ID of the Azure Monitor Workspace."
}

variable "module_name_prefix" {
  type        = string
  description = "Prefix for naming the resources in this module"
  default     = "MSMonitor"
}

variable "public_network_access_enabled" {
  description = "Whether network access from public internet to the Data Collection Endpoint are allowed"
  type        = string
  default     = "false"
  validation {
    condition = contains([
      "true",
      "false"
    ], lower(self))
    error_message = "Choose between true or false"
  }
}
