/* Provider azuread do not implement yet these resources
// Restrict Guest Directory Permissions (Zero Trust)
resource "azuread_authorization_policy" "guest_restrictions" {
    default_user_role_permissions {
        allowed_to_read_other_users = false
    }

    guest_user_role_id = var.guest_user_role_id
}

// Disable Security Defaults (Enterprise Environments)
resource "azuread_identity_security_defaults_enforcement_policy" "disable_defaults" {
    is_enabled = false
}

// Restrict B2B Invitations to Approved Partner Domains
resource "azuread_external_identities_policy" "b2b_domain_restricted" {
    b2b_collaboration_enabled = true

    b2b_collaboration_policy {
        targeted_audiences = var.b2b_targeted_audiences
        invitations_allowed = var.b2b_invitations_allowed

        allowed_external_domains = [
            "partner1.com",
            "partner2.com"
        ]
    }
}
*/
