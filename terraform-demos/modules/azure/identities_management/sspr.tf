/* Provider azuread do not implement yet these resources
resource "azuread_authentication_method_policy" "sspr_policy" {
  description = "Policy for Self-Service Password Reset (SSPR)"
  password_reset {
    is_enabled = true
    allowed_to_reset = "all"
  }
}

resource "azuread_authentication_method_email" "sspr_email" {
  state = "enabled"
}

resource "azuread_authentication_method_sms" "sspr_sms" {
  state = "enabled"
}

resource "azuread_authentication_method_security_question" "sspr_security_questions" {
  state = "disabled"
}
*/