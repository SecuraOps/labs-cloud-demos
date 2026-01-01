resource "azurerm_resource_group" "demo" {
  name     = "rg-${var.environment}-identities-demo"
  location = var.location

  tags = {
    environment = var.environment
    project    = "identities-management-demo"
  }
}