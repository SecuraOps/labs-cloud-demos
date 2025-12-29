terraform {
  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id

  //// For use with Service Principal authentication
  //tenant_id       = var.azure_tenant_id
  //client_id       = var.azure_client_id
  //client_secret   = var.azure_client_secret
}
