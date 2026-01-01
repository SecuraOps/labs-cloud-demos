#!/bin/bash

# Prerequisites:
az login
az account show

# Required permissions (delegated or app):
## Policy.ReadWrite.Authorization
## Directory.ReadWrite.All

# 1. View Current B2B Collaboration Settings
az rest --method GET --uri "https://graph.microsoft.com/beta/externalCollaborationSettings"

# 2. Configure B2B External Collaboration (Secure Baseline)
az rest --method PATCH \
 --uri "https://graph.microsoft.com/beta/externalCollaborationSettings"
 --headers 'Content-Type=application/json' \
 --body '{
   "allowExternalIdentitiesToLeaveOrganization": false, # Prevents guest-initiated exits
   "b2bCollaborationEnabled": true,
   "b2bCollaborationPolicy": {
     "targetAudience": "AllUsers", # Applies tenant-wide
     "invitationsAllowed": "AdminsAndGuestInviters", # Prevents random users inviting externals
     "guestUserRoleId": null
    }
 }'

# 3. Lock Down Guest Permissions (Zero Trust):
## Guests cannot enumerate users
## Reduced lateral movement risk
az rest --method PATCH \
  --uri "https://graph.microsoft.com/beta/policies/authorizationPolicy" \
  --headers "Content-Type=application/json" \
  --body '{
    "defaultUserRolePermissions": {
      "allowedToReadOtherUsers": false
    },
    "guestUserRoleId": null
  }'

# 4. Disable Guest Self-Service Sign-Up (Recommended)
## Use Conditional Access instead of Security Defaults for enterprise environments.
az rest --method PATCH \
  --uri "https://graph.microsoft.com/beta/policies/identitySecurityDefaultsEnforcementPolicy" \
  --headers "Content-Type=application/json" \
  --body '{
    "isEnabled": false
  }'

# 5. Restrict Invitations to Specific Domains
## If you want allow-listing (recommended for partners):
az rest --method PATCH \
  --uri "https://graph.microsoft.com/v1.0/policies/externalIdentitiesPolicy" \
  --headers "Content-Type=application/json" \
  --body '{
    "b2bCollaborationPolicy": {
      "invitationsAllowed": "AdminsOnly",
      "targetedAudience": "AllUsers",
      "allowedExternalDomains": [
        "partner1.com",
        "partner2.com"
      ]
    }
  }'


