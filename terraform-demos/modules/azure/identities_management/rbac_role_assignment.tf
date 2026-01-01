resource "azurerm_role_assignment" "reader_rg" {
  scope                = azurerm_resource_group.demo.id
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_object_id
}