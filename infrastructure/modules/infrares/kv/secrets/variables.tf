variable "secret_names" {
  description = "A list of secret names to create in the Key Vault."
  type        = set(string)
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where the secrets should be created."
  type        = string
}

variable "secret_values" {
  description = "A map of secret names to secret values."
  type        = map(string)
}
