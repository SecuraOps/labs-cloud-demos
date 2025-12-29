#!/bin/bash

RG_NAME="rg-demo-finops"

az group delete \
  --name $RG_NAME \
  --yes \
  --no-wait

echo "🧹 Demo Azure environment deletion initiated."