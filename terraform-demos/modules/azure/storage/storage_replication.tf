resource "azurerm_storage_account" "demo" {
  name                     = "staccdemo"
  resource_group_name      = "rg-demo"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = var.replication_type

  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"

  tags = {
    Environment = "Prod"
  }
}
