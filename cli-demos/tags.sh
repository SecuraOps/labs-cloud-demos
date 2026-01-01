#!/bin/bash

RESOURCE_GROUP="rg-demo"
RESOURCE_NAME="myVM"
RESOURCE_TYPE="Microsoft.Compute/virtualMachines"
SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"

TAGS="Environment=Dev Project=Contoso"

# a) Tag a Resource
az resource tag \
  --tags $TAGS \
  --resource-group $RESOURCE_GROUP \
  --name $RESOURCE_NAME \
  --resource-type $RESOURCE_TYPE
# or
resource=$(az resource show -g $RESOURCE_GROUP -n $RESOURCE_NAME --resource-type $RESOURCE_TYPE --query "id" --output tsv)
az tag create --resource-id $resource --tags $TAGS
# if you want to merge tags instead of replacing them, use --operation Merge
az tag update --resource-id $resource --operation Merge --tags Status=Green

# b) Tag a Resource Group
az group update \
  --name $RESOURCE_GROUP \
  --tags $TAGS
# or
az tag create --resource-id /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP --tags $TAGS

# c) Tag a Subscription
az account set --subscription $SUBSCRIPTION_ID

az tag create --name "Environment"
az tag create --name "Project"

az tag add-value --name "Environment" --value "Dev"
az tag add-value --name "Project" --value "Contoso"

