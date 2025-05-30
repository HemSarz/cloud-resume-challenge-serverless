terraform {
  backend "azurerm" {
    resource_group_name  = "bckndrg"
    storage_account_name = "stgbcknd"
    container_name       = "bckndstatecont"
    key                  = "tfstatebcknd"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.23.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.2.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy      = true
      recover_soft_deleted_certificates = false
    }
  }
  use_oidc = true
}
