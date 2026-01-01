#!/bin/bash

######
# Key Concept (Important)

# Azure Storage replication is controlled by the SKU:

# Replication	SKU Name
# LRS	        Standard_LRS
# ZRS	        Standard_ZRS
# GRS	        Standard_GRS
# GZRS	        Standard_GZRS

# ⚠️ Changing replication may recreate the storage account depending on source/target SKU.
######

RESOURCE_GROUP="rg-demo"
STORAGE_ACCOUNT="staccdemo"
LOCATION="westeurope"
REPLICATION="Standard_GZRS"   # LRS | ZRS | GRS | GZRS

# a) Create Storage Account with Replication
az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION \
  --sku $REPLICATION \
  --kind StorageV2 \
  --https-only true \
  --min-tls-version TLS1_2

# b) Update Replication of existing Storage Account
az storage account update \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --sku $REPLICATION

# Note: ⚠️ Some changes (e.g. LRS → GZRS) may fail and require recreation.

