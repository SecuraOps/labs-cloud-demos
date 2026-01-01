#!/bin/bash

POLICY_NAME="require-tags"
POLICY_DISPLAY_NAME="Require 'Environment' tag on resources"
DESCRIPTION="This policy enforces that all resources have the 'Environment' tag."
SCOPE="/subscriptions/<SUBSCRIPTION_ID>"

# a) Create a policy definition
az policy definition create \
  --name "$POLICY_NAME" \
  --display-name "$POLICY_DISPLAY_NAME" \
  --description "$DESCRIPTION" \
  --rules '{
    "if": {
      "field": "tags.Environment",
      "equals": ""
    },
    "then": {
      "effect": "deny"
    }
  }' \
  --mode All

  # b) Assign the policy
  az policy assignment create \
  --name "${POLICY_NAME}-assignment" \
  --policy "$POLICY_NAME" \
  --scope "$SCOPE"

