variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Cosmos DB account."
}

variable "location" {
  type        = string
  description = "The Azure region where the Cosmos DB account should be created."
}

variable "cosmosdb_account_name" {
  type        = string
  description = "The name of the Cosmos DB account."
}

variable "offer_type" {
  type        = string
  description = "The offer type for the Cosmos DB account (e.g., Standard)."
  default     = "Standard"
}

variable "consistency_level" {
  type        = string
  description = "The consistency level for the Cosmos DB account."
  default     = "Session"
}

variable "default_consistency_interval_in_seconds" {
  type        = number
  description = "The default consistency interval in seconds."
  default     = 5
}

variable "default_consistency_max_staleness_interval_in_seconds" {
  type        = number
  description = "The default consistency max staleness interval in seconds."
  default     = 10
}

variable "database_name" {
  type        = string
  description = "The name of the Cosmos DB database."
}

variable "container_name" {
  type        = string
  description = "The name of the Cosmos DB container."
}

variable "partition_key_paths" {
  type        = string
  description = "The partition key path for the Cosmos DB container."
}
