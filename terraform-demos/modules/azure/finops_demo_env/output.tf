output "resource_group_name" {
  value = azurerm_resource_group.demo.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.demo.name
}

output "subnet_name" {
  value = azurerm_subnet.demo.name
}

output "storage_account_name" {
  value = azurerm_storage_account.demo.name
}