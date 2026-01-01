//Configure B2B External Collaboration Policy (Secure Baseline)
/* Provider azuread do not implement yet these resources
resource "azuread_external_identities_policy" "b2b_baseline" {
  b2b_collaboration_enabled = true

  allow_external_identities_to_leave_organization = false

  b2b_collaboration_settings {
    targeted_audiences = var.b2b_targeted_audiences
    invitations_allowed = var.b2b_invitations_allowed
  }
}
*/