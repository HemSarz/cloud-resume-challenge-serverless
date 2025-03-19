variable "name" {
  description = "The name of the resource group"
  type        = string
  default     = {}
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
