#!/bin/bash

# =============================
# VARIABLES
# =============================
LOCATION="westeurope"
RG_NAME="rg-demo-finops"
VNET_NAME="vnet-demo"
SUBNET_NAME="subnet-demo"
VM_NAME="vm-demo-oversized"
ADMIN_USER="azureadmin"
VM_SIZE="Standard_D4s_v5"
STORAGE_NAME="demofinops$RANDOM"
PUBLIC_IP_NAME="pip-demo"

# =============================
# CREATE RESOURCE GROUP
# =============================
az group create \
  --name $RG_NAME \
  --location $LOCATION

# =============================
# CREATE NETWORK
# =============================
az network vnet create \
  --resource-group $RG_NAME \
  --name $VNET_NAME \
  --address-prefix 10.0.0.0/16 \
  --subnet-name $SUBNET_NAME \
  --subnet-prefix 10.0.1.0/24

# =============================
# CREATE UNUSED PUBLIC IP
# =============================
az network public-ip create \
  --resource-group $RG_NAME \
  --name $PUBLIC_IP_NAME \
  --sku Standard

# =============================
# CREATE OVERSIZED VM (INTENTIONAL)
# =============================
az vm create \
  --resource-group $RG_NAME \
  --name $VM_NAME \
  --image Ubuntu2204 \
  --size $VM_SIZE \
  --admin-username $ADMIN_USER \
  --generate-ssh-keys \
  --vnet-name $VNET_NAME \
  --subnet $SUBNET_NAME \
  --public-ip-address "" \
  --no-wait

# =============================
# CREATE STORAGE ACCOUNT (NO LIFECYCLE)
# =============================
az storage account create \
  --name $STORAGE_NAME \
  --resource-group $RG_NAME \
  --location $LOCATION \
  --sku Standard_LRS

echo "✅ Demo Azure FinOps environment provisioned."
echo "⚠️ Note: No tags, no budgets, oversized VM (intentional)."