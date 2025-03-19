variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Private Endpoint."
}

variable "location" {
  type        = string
  description = "The Azure region where the Private Endpoint should be created."
}

variable "private_endpoint_name" {
  type        = string
  description = "The name of the Private Endpoint."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to create the Private Endpoint in."
}

variable "private_service_connection" {
  type = object({
    name                           = string
    is_manual_connection           = bool
    private_connection_resource_id = string
    subresource_names              = list(string)
  })
  description = "The private service connection configuration."
}

variable "private_dns_zone_group" {
  type = list(object({
    name                 = string
    private_dns_zone_ids = list(string)
  }))
  description = "A list of private DNS zone groups for the Private Endpoint."
  default     = []
}
