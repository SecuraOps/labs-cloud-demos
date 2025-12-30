terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id

  //// For use with Service Principal authentication
  //tenant_id       = var.azure_tenant_id
  //client_id       = var.azure_client_id
  //client_secret   = var.azure_client_secret
}

provider "azuread" {
  tenant_id = var.azure_tenant_id

  //// For use with Service Principal authentication
  //client_id     = var.azure_client_id
  //client_secret = var.azure_client_secret
}
