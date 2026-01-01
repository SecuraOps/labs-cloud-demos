# Prerequisites
Install-Module Microsoft.Graph -Scope CurrentUser -Force

# Connect to Microsoft Graph
Connect-MgGraph -Scopes `
  "Policy.ReadWrite.Authorization",
  "Directory.ReadWrite.All"

Select-MgProfile -Name "v1.0"

# View Current External Collaboration Settings
Get-MgPolicyExternalIdentitiesPolicy | Format-List

# Configure B2B External Collaboration (Secure Baseline)
$ExternalIdentitiesPolicyParams = @{
    AllowExternalIdentitiesToLeaveOrganization = $false
    B2bCollaborationEnabled                    = $true
    B2bCollaborationPolicy = @{
        TargetedAudience     = "AllUsers"
        InvitationsAllowed   = "AdminsAndGuestInviters"
        GuestUserRoleId      = $null
    }
}

Update-MgPolicyExternalIdentitiesPolicy `
    -BodyParameter $ExternalIdentitiesPolicyParams

# Restrict Guest Permissions (Zero Trust Control)
$AuthorizationPolicyParams = @{
    DefaultUserRolePermissions = @{
        AllowedToReadOtherUsers = $false
    }
    GuestUserRoleId = $null
}

Update-MgPolicyAuthorizationPolicy `
    -BodyParameter $AuthorizationPolicyParams

# Disable Security Defaults (Enterprise Recommended)
Update-MgPolicyIdentitySecurityDefaultsEnforcementPolicy `
    -IsEnabled:$false

# Restrict Guest Invitations to Approved Domains
$RestrictedDomainsPolicyParams = @{
    B2bCollaborationPolicy = @{
        InvitationsAllowed = "AdminsOnly"
        TargetedAudience   = "AllUsers"
        AllowedExternalDomains = @(
            "partner1.com",
            "partner2.com"
        )
    }
}

Update-MgPolicyExternalIdentitiesPolicy `
    -BodyParameter $RestrictedDomainsPolicyParams

