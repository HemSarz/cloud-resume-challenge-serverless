variable "name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
}

variable "enabled_for_disk_encryption" {
  description = "Indicates whether the Key Vault is enabled for disk encryption."
  type        = bool
}

variable "purge_protection_enabled" {
  description = "Indicates whether purge protection is enabled for the Key Vault."
  type        = bool
}
