variable "resource_group_name" {
  description = "The name of the Resource Group in which the Subnets should be created."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network in which the Subnets should be created."
  type        = string
}

variable "subnets" {
  description = "A map of subnets to create."
  type = map(object({
    name           = string
    address_prefix = string
  }))
}
