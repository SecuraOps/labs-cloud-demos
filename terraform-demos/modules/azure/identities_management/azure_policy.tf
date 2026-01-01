resource "azurerm_policy_definition" "require_tags" {
  name         = "require-tags"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Require 'Environment' tag on resources"
  description  = "This policy enforces that all resources have the 'Environment' tag."

  policy_rule = <<POLICY
{
  "if": {
    "field": "tags.Environment",
    "equals": ""
  },
  "then": {
    "effect": "deny"
  }
}
POLICY
}

data "azurerm_subscription" "primary" {}

/* The provider hashicorp/azurerm does not support resource type "azurerm_policy_assignment".
resource "azurerm_policy_assignment" "require_tags_assignment" {
  name                 = "require-tags-assignment"
  policy_definition_id = azurerm_policy_definition.require_tags.id
  //scope                = azurerm_resource_group.demo.id // Uncomment to assign at resource group level
  scope                = data.azurerm_subscription.primary.id // Assign at subscription level
}
*/
