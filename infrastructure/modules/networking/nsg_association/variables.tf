variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to associate with the Network Security Group."
}

variable "network_security_group_id" {
  type        = string
  description = "The ID of the Network Security Group to associate with the subnet."
}
