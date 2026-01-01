# Prerequisites
Install-Module Az -Scope CurrentUser -Force
Connect-AzAccount
Set-AzContext -Subscription "<SUBSCRIPTION_ID>"

# Script
$SubscriptionId = "<SUBSCRIPTION_ID>"
$ResourceGroup = "rg-demo"
$RoleName      = "Reader"
$PrincipalId   = "<OBJECT_ID_OF_USER_GROUP_OR_SP>"

$Scope = "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroup"

Write-Host "Assigning role '$RoleName' to principal $PrincipalId on $Scope"

New-AzRoleAssignment `
  -ObjectId $PrincipalId `
  -RoleDefinitionName $RoleName `
  -Scope $Scope

Write-Host "RBAC role assigned successfully."


