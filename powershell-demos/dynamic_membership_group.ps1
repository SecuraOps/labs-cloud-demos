# Prerequisites:
# Install required modules (run once)
Install-Module Az -Scope CurrentUser -Repository PSGallery -Force
Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force

# - Connect to Microsoft Graph with appropriate permissions: Connect-MgGraph -Scopes "Group.ReadWrite.All","Directory.ReadWrite.All"
Connect-AzAccount

# Required permissions:
# Group.ReadWrite.All
# Directory.ReadWrite.All
Connect-MgGraph -Scopes "Group.ReadWrite.All","Directory.ReadWrite.All"

# -----------------------------
# Zero Trust DevOps Group Setup
# -----------------------------

$GroupName        = "ZT-DevOps-Engineers"
$MailNickname    = "zt-devops-engineers"
$Description     = "Zero Trust dynamic security group for DevOps engineers (least privilege, identity-based)"

$MembershipRule  = '(user.accountEnabled -eq true) and (user.jobTitle -contains "DevOps") and (user.userPrincipalName -endsWith "@corp.contoso.com") and (user.userType -eq "Member")'

Write-Host "Creating Zero Trust dynamic security group: $GroupName"

New-MgGroup `
    -DisplayName $GroupName `
    -MailEnabled:$false `
    -MailNickname $MailNickname `
    -SecurityEnabled:$true `
    -GroupTypes "DynamicMembership" `
    -MembershipRule $MembershipRule `
    -MembershipRuleProcessingState "On" `
    -Description $Description

#Write-Host "Group created successfully."

# Optional Enhancements (Recommended)
# Validate group creation
$createdGroup = Get-MgGroup -Filter "displayName eq '$GroupName'"
if ($createdGroup) {
    Write-Host "Group created successfully."
} else {
    Write-Host "Failed to create group."
}

# Disable rule processing (maintenance / audit)
# Update-MgGroup `
#  -GroupId "<GROUP_ID>" `
#  -MembershipRuleProcessingState "Paused"
