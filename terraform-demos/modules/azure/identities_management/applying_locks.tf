/* a) Lock a Resource
resource "azurerm_management_lock" "vm_lock" {
  name       = "lock-myVM"
  scope      = module.finops_demo_env.vm_id
  lock_level = "CanNotDelete"
}
*/

//b) Lock a Resource Group
resource "azurerm_management_lock" "rg_lock" {
  name       = "lock-rg-demo"
  scope      = azurerm_resource_group.demo.id
  lock_level = "CanNotDelete"
}


resource "azurerm_management_lock" "subscription_lock" {
  name       = "lock-subscription"
  scope      = "/subscriptions/${var.azure_subscription_id}"
  lock_level = "CanNotDelete"
}
