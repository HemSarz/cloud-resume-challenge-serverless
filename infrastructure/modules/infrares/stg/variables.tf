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
  type        = string
  description = "The storage account tier."
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier) # Corrected line
    error_message = "The account_tier must be either Standard or Premium."
  }
}

variable "account_replication_type" {
  type        = string
  description = "The storage account replication type."
  validation {
    condition     = contains(["LRS", "GRS", "ZRS", "GZRS", "RAGRS", "RAGZRS"], var.account_replication_type) # Corrected line
    error_message = "The account_replication_type must be one of: LRS, GRS, ZRS, GZRS, RAGRS, RAGZRS."
  }
}

variable "tags" {
  description = "A map of tags to assign to the storage account."
  type        = string
  default     = "dev"
}
