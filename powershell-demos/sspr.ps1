Install-Module Microsoft.Graph -Scope CurrentUser -Force

Connect-MgGraph -Scopes `
  "Policy.ReadWrite.AuthenticationMethod",
  "Directory.ReadWrite.All"

Select-MgProfile -Name "v1.0"

# Enable SSPR (Tenant-Wide)
$AuthMethodsPolicyParams = @{
    PasswordReset = @{
        IsEnabled      = $true
        AllowedToReset = "all"
    }
}

Update-MgPolicyAuthenticationMethodsPolicy `
  -BodyParameter $AuthMethodsPolicyParams

# Enable Secure Recovery Methods (Required)
## Enable Email
Update-MgPolicyAuthenticationMethodConfiguration `
  -AuthenticationMethodConfigurationId "email" `
  -State "enabled"
## Enable SMS (mobile phone)
Update-MgPolicyAuthenticationMethodConfiguration `
  -AuthenticationMethodConfigurationId "sms" `
  -State "enabled"
## Disable Weak Recovery Methods (Strongly Recommended)
Update-MgPolicyAuthenticationMethodConfiguration `
  -AuthenticationMethodConfigurationId "securityQuestions" `
  -State "disabled"

# Validate SSPR Settings
Get-MgPolicyAuthenticationMethodsPolicy | Select-Object PasswordReset

# Enable password writeback for SSPR to on-premises (if applicable)
## OPTION A — Microsoft Entra Connect (Classic / PTA / ADFS): Run on the Entra Connect server:
Import-Module ADSync

Set-ADSyncAADPasswordWritebackConfiguration `
  -Enable $true
### Verify:
Get-ADSyncAADPasswordWritebackConfiguration
### Verify SSPR + Writeback Status
Get-ADSyncScheduler
## OPTION B — Entra Cloud Sync (Modern, Recommended): Enable writeback (PowerShell – agent host), Requires Cloud Sync agent ≥ latest version
Import-Module Microsoft.Entra.CloudSync.PowerShell

Enable-EntraCloudSyncPasswordWriteback
## OPTION 1 — Azure AD Connect (Most Common): Enable Password Writeback (PowerShell on the AAD Connect server)
## Run locally on the Azure AD Connect server
## (as Administrator)
Import-Module ADSync

Set-ADSyncAADCompanyFeature `
  -PasswordWriteback $true
### Verify:
Get-ADSyncAADCompanyFeature | Select PasswordWriteback
### Also ensure the feature is enabled in the wizard On the same server:
Start-ADSyncConfigurationWizard
## OPTION 2 — Entra Cloud Sync (Modern, Recommended): Enable writeback (PowerShell – agent host), Requires Cloud Sync agent ≥ latest version
Install-Module Microsoft.Entra -Force
Connect-Entra

Enable-EntraDirectoryPasswordWriteback






