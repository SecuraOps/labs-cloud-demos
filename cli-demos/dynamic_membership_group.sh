#!/bin/bash

set -e

## Here’s an Azure CLI script that creates an Azure AD (Entra ID) dynamic security group using a membership rule.
## Example: Dynamic security group based on user department = "IT"

# Variables
GROUP_NAME="IT-Dynamic-Security-Group"
DESCRIPTION="Dynamic security group for IT department users"
MEMBERSHIP_RULE='(user.department -eq "IT")'
COMMON_MEMBERSHIP_RULES=[
  '(user.jobTitle -eq "Manager")', # Based on user job title
  '(user.country -eq "US")',
  '(user.accountEnabled -eq true)', # Based on account enabled status
  '(user.userPrincipalName -contains "@contoso.com")', # Based on user UPN domain
  '(device.deviceOSType -eq "Windows")', # Device-based dynamic group (example)
]

echo "Creating Dynamic security group for IT department users. Group name: $GROUP_NAME"

# Create the dynamic security group
az ad group create \
  --display-name "$GROUP_NAME" \
  --mail-nickname "it-dynamic-sec-group" \
  --description "$DESCRIPTION" \
  --security-enabled true \
  --membership-type Dynamic \
  --membership-rule "$MEMBERSHIP_RULE" \
  --membership-rule-processing-state On

# -----------------------------
# Zero Trust DevOps Group Setup
# -----------------------------

GROUP_NAME="ZT-DevOps-Engineers"
MAIL_NICKNAME="zt-devops-engineers"
DESCRIPTION="Zero Trust dynamic security group for DevOps engineers (least privilege, identity-based)"

MEMBERSHIP_RULE='(user.accountEnabled -eq true) and (user.jobTitle -contains "DevOps") and (user.userPrincipalName -endsWith "@corp.contoso.com") and (user.userType -eq "Member")'

echo "Creating Zero Trust dynamic security group: $GROUP_NAME"

az ad group create \
  --display-name "$GROUP_NAME" \
  --mail-nickname "$MAIL_NICKNAME" \
  --description "$DESCRIPTION" \
  --security-enabled true \
  --membership-type Dynamic \
  --membership-rule "$MEMBERSHIP_RULE" \
  --membership-rule-processing-state On

echo "Group created successfully."

