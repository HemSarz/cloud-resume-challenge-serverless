variable "name" {
  description = "The name of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account should be created."
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account (e.g. Standard, Premium)."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], self)
    error_message = "Account tier must be either Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "The replication type for the storage account (e.g. LRS, GRS, ZRS)."
  type        = string
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "GRS", "ZRS", "GZRS", "RAGRS", "RAGZRS"], self)
    error_message = "Valid values for account replication type are LRS, GRS, ZRS, GZRS, RAGRS, and RAGZRS."
  }
}

variable "tags" {
  description = "A map of tags to assign to the storage account."
  type        = string
  default     = "dev"
}
