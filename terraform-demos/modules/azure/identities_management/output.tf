output "zt_devops_engineers_group_id" {
  value       = azuread_group.zt_devops_engineers.id
  description = "Object ID of the Zero Trust DevOps dynamic group"
}

/* Provider do not implement yet these resources
output "b2b_collaboration_enabled" {
  value       = azuread_external_identities_policy.b2b_baseline.b2b_collaboration_enabled
  description = "Indicates if B2B collaboration is enabled"
}

output "guest_user_restrictions_applied" {
  value       = azuread_authorization_policy.guest_restrictions.guest_user_role_id != null
  description = "Indicates if guest user restrictions have been applied"
}

output "sspr_enabled" {
  value       = azuread_authentication_method_policy.sspr_policy.password_reset[0].is_enabled
  description = "Indicates if Self-Service Password Reset (SSPR) is enabled"
}
*/
