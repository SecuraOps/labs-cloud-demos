#!/bin/bash

# Check current authentication methods policy
az rest --method GET \
  --uri "https://graph.microsoft.com/v1.0/policies/authenticationMethodsPolicy"


# Enable Self-Service Password Reset (Recommended Secure Baseline)
az rest --method PATCH \
  --uri "https://graph.microsoft.com/v1.0/policies/authenticationMethodsPolicy" \
  --headers "Content-Type=application/json" \
  --body '{
    "policyVersion": "1",
    "passwordReset": {
      "isEnabled": true,
      "allowedToReset": "all"
    }
  }'

# Enable Secure Authentication Methods for SSPR
az rest --method PATCH \
  --uri "https://graph.microsoft.com/v1.0/policies/authenticationMethodsPolicy/authenticationMethodConfigurations/email" \
  --headers "Content-Type=application/json" \
  --body '{ "state": "enabled" }'
az rest --method PATCH \
  --uri "https://graph.microsoft.com/v1.0/policies/authenticationMethodsPolicy/authenticationMethodConfigurations/sms" \
  --headers "Content-Type=application/json" \
  --body '{ "state": "enabled" }'

# Disable security questions (legacy & insecure)
az rest --method PATCH \
  --uri "https://graph.microsoft.com/v1.0/policies/authenticationMethodsPolicy/authenticationMethodConfigurations/securityQuestions" \
  --headers "Content-Type=application/json" \
  --body '{ "state": "disabled" }'

