resource "azuread_group" "zt_devops_engineers" {
  display_name     = "ZT-DevOps-Engineers"
  description      = "Zero Trust dynamic security group for DevOps engineers (least privilege, identity-based)"
  security_enabled = true
  mail_enabled     = false
  mail_nickname    = "zt-devops-engineers"

  types = ["DynamicMembership"]

  dynamic_membership {
    enabled = true
    rule = <<RULE
(user.accountEnabled -eq true)
and (user.jobTitle -contains "DevOps")
and (user.userPrincipalName -endsWith "@corp.contoso.com")
and (user.userType -eq "Member")
RULE
  }
}
