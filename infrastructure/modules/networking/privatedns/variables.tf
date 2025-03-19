variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Private DNS Zone."
}

variable "location" {
  type        = string
  description = "The Azure region where the Private DNS Zone should be created."
}

variable "private_dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone."
}

variable "virtual_network_link" {
  type = list(object({
    name               = string
    virtual_network_id = string
  }))
  description = "A list of virtual network links for the Private DNS Zone."
  default     = []
}
