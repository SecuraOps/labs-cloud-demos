#!/bin/bash
# Prerequisites:
az login
az account set --subscription <SUBSCRIPTION_ID>

set -e

SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
RESOURCE_GROUP="rg-demo"
# To get available roles: az role definition list --query "[].{RoleName:roleName}" -o table
# Common roles: Owner, Contributor, Reader, User Access Administrator
# Built-in roles: az role definition list --query "[?roleType=='BuiltInRole']" -o table
# az role definition list --query "[?contains(roleName, 'Reader')]" -o table
ROLE_NAME="Reader"
# To get OBJECT_ID of a user, group, or service principal, you can use:
# (List users) az ad user list --filter "userPrincipalName eq '<user-email>'" --query "[0].id" -o tsv
# az ad user show --id <user-email> --query id -o tsv
# az ad group show --group <group-name> --query id -o tsv
# (By app (client) ID – safest) az ad sp show --id <app-id> --query id -o tsv
# (By service principal name) az ad sp list --display-name <sp-name> --query "[0].id" -o tsv
PRINCIPAL_OBJECT_ID="<OBJECT_ID_OF_USER_GROUP_OR_SP>"

SCOPE="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}"

echo "Assigning role '${ROLE_NAME}' to principal ${PRINCIPAL_OBJECT_ID} on ${SCOPE}"

az role assignment create \
  --assignee-object-id "$PRINCIPAL_OBJECT_ID" \
  --assignee-principal-type Group \
  --role "$ROLE_NAME" \
  --scope "$SCOPE"
# --assignee-principal-type User|Group|ServicePrincipal
echo "RBAC role assigned successfully."