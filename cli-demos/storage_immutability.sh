#!/bin/bash

##################################################
# Azure Storage Immutability – Key Facts (Important)
# - Applies to Blob containers
# - Two modes:
#   - Unlocked → can be modified
#   - Locked → permanent (cannot be removed)
# - Common use cases:
#   - Regulatory compliance
#   - Ransomware protection
#   - Backup immutability

RESOURCE_GROUP="rg-demo"
STORAGE_ACCOUNT="staccdemo"
CONTAINER_NAME="immutable-container"
RETENTION_DAYS=30

# a) Create a Blob Container
az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT \
  --auth-mode login

# b) Set an Unlocked Immutability Policy
az storage container immutability-policy create \
  --account-name $STORAGE_ACCOUNT \
  --container-name $CONTAINER_NAME \
  --period $RETENTION_DAYS \
  --allow-protected-append-writes true

# c) Lock the Immutability Policy (Irreversible)
az storage container immutability-policy lock \
  --account-name $STORAGE_ACCOUNT \
  --container-name $CONTAINER_NAME

