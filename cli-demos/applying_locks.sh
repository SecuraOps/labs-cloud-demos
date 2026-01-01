#!/bin/bash

SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
RESOURCE_GROUP="rg-demo"
RESOURCE_NAME="myVM"
RESOURCE_TYPE="Microsoft.Compute/virtualMachines"
LOCK_NAME="lock-myVM"
LOCK_LEVEL="CanNotDelete" # Options: CanNotDelete, ReadOnly

# a) Lock a Resource
SCOPE="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}/providers/${RESOURCE_TYPE}/${RESOURCE_NAME}"

az lock create \
  --name "$LOCK_NAME" \
  --lock-type "$LOCK_LEVEL" \
  --resource-group "$RESOURCE_GROUP" \
  --resource-name "$RESOURCE_NAME" \
  --resource-type "$RESOURCE_TYPE"

#  b) Lock a Resource Group
SCOPE="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}"

az lock create \
  --name "lock-${RESOURCE_GROUP}" \
  --lock-type "$LOCK_LEVEL" \
  --resource-group "$RESOURCE_GROUP"

# c) Lock a Subscription
SCOPE="/subscriptions/${SUBSCRIPTION_ID}"

az lock create \
  --name "lock-subscription" \
  --lock-type "$LOCK_LEVEL" \
  --scope "$SCOPE"



