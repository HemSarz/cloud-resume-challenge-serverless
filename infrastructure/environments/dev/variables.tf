variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "test"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "westeurope"
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
  default     = "tfaz"
}

variable "functions_stgName" {
  description = "Name of the storage account for Azure Functions."
  type        = string
  default     = "tfazfuncstg001"

}

variable "keyvault_name" {
  description = "Name of the key vault."
  type        = string
  default     = "kv01tfazdev"
}

variable "cosmosdb_account_name" {
  description = "Name of the Cosmos DB account."
  type        = string
  default     = "tfazdbacc"
}

variable "cosmosdb_database_name" {
  description = "Name of the Cosmos DB database."
  type        = string
  default     = "dbtfaz"
}

variable "cosmosdb_container_name" {
  description = "Name of the Cosmos DB container."
  type        = string
  default     = "tfazdbcont"
}

variable "function_app_name" {
  description = "Name of the Azure Function App."
  type        = string
  default     = "dev-func"
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
  default     = "vnet-dev"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}


##########################

# OIDC

# modules/azuread_github_federated_identity/variables.tf

variable "prefix" {
  type        = string
  default     = "tfaz-dev"
  description = "Prefix for the display names."
}

# variable "application_display_name" {
#   type        = string
#   description = "Display name of the Azure AD application."
# }

variable "fic_display_name_env" {
  type        = string
  default     = "github-actions-fic-env"
  description = "Display name prefix for environment federated identity credentials."
}

variable "fic_display_name_branch" {
  type        = string
  default     = "github-actions-fic-branch"
  description = "Display name prefix for branch federated identity credentials."
}

variable "gh_org_name" {
  type        = string
  description = "GitHub organization name."
  default     = "hemsarz"
}

variable "gh_repo_name" {
  type        = string
  description = "GitHub repository name."
  default     = "cloud-resume-challenge-serverless"
}

variable "gh_branches" {
  type        = list(string)
  default     = ["main"]
  description = "List of GitHub branches to create federated identity credentials for."
  validation {
    condition = alltrue([
      for branch in var.gh_branches : contains([
        "main"
      ], lower(branch))
    ])
    error_message = "Choose correct branch"
  }
}

variable "gh_env" {
  type        = list(string)
  default     = ["dev", "prod", "qa"]
  description = "List of GitHub environments to create federated identity credentials for."
}

# variable "audiences" {
#   type = string
# }

# variable "issuer" {
#   type = string
# }

# variable "subject" {
#   type = string
# }
# 

# variable "identity_type" {
#   type        = string
#   description = "The type of identity to assign to the Static Web App. Possible values are 'SystemAssigned' (default) or 'UserAssigned'."
#   default     = "SystemAssigned"
# }
