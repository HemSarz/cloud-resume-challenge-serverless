variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Virtual Network."
}

variable "location" {
  type        = string
  description = "The Azure region where the Virtual Network should be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network."
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
}
