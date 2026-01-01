variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "b2b_targeted_audiences" {
  type    = list(string)
  default = ["AllUsers"]
}

variable "b2b_invitations_allowed" {
  type = list(string)
  default = [ "AdminsAndGuestInviters" ]
}

variable "guest_user_role_id" {
  type = string
  default = null
}

variable "role_definition_name" {
  type = string
  default = "Reader"
}

variable "principal_object_id" {
  type = string
  description = "Object ID of the user, group, or service principal"
}

variable "azure_subscription_id" {
  type = string
  description = "Azure Subscription ID"
}