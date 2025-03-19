variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Network Security Group."
}

variable "location" {
  type        = string
  description = "The Azure region where the Network Security Group should be created."
}

variable "nsg_name" {
  type        = string
  description = "The name of the Network Security Group."
}

variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "A list of security rules for the Network Security Group."
  default     = {}
}
