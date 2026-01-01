#!/bin/bash

RESOURCE_GROUP="rg-demo"
STORAGE_ACCOUNT="staccdemo"
CONTAINER_NAME="mycontainer"
PERMISSIONS="rwdl"    # read, write, delete, list
EXPIRY=$(date -u -d "1 day" '+%Y-%m-%dT%H:%MZ')  # expires in 1 day

# a) Generate a SAS for the Storage Account (Account SAS)
az storage account generate-sas \
  --permissions $PERMISSIONS \
  --account-name $STORAGE_ACCOUNT \
  --services b   \
  --resource-types sco \
  --expiry $EXPIRY \
  --https-only \
  --output tsv
## --services b → Blob (use q for Queue, t for Table, f for File)
## --resource-types s,c,o → Service, Container, Object
## --full-url → To get the full URL with SAS token (not just the token)

# b) Generate a SAS for the Blob Container (Service SAS)
ACCOUNT_KEY=$(az storage account keys list \
  --account-name $STORAGE_ACCOUNT \
  --query "[0].value" -o tsv)

az storage container generate-sas \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT \
  --account-key $ACCOUNT_KEY \
  --permissions $PERMISSIONS \
  --expiry $EXPIRY \
  --https-only \
  --output tsv

# c) Generate a SAS for a specific Blob (Service SAS)
az storage blob generate-sas \
 --account-name <storage-account> \
 --container-name <container> \
 --name <blob> \
 --permissions acdrw \
 --expiry <date-time> \
 --auth-mode login \
 --as-user \
 --full-uri

