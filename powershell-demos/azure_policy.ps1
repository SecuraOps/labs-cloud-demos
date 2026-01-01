# a) Create a policy definition
$policyDefinition = @{
    Name        = "require-tags"
    DisplayName = "Require 'Environment' tag on resources"
    Description = "This policy enforces that all resources have the 'Environment' tag."
    PolicyRule  = @{
        "if" = @{
            "field"  = "tags.Environment"
            "equals" = ""
        }
        "then" = @{
            "effect" = "deny"
        }
    } | ConvertTo-Json -Depth 10
    Mode        = "All"
}

New-AzPolicyDefinition @policyDefinition

# b) Assign the policy to a scope (e.g., resource group)
$subscriptionId = "<SUBSCRIPTION_ID>"
$scope = "/subscriptions/$subscriptionId"

New-AzPolicyAssignment -Name "require-tags-assignment" -PolicyDefinition "require-tags" -Scope $scope

