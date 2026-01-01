variable "cloud" {
  description = "Target cloud provider (azure | aws | gcp)"
  type        = string
  default     = "azure"
}

variable "location" {
  description = "Region"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  type    = string
  default = "demo"
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string

  validation {
    condition = length(var.azure_subscription_id) > 0
    error_message = "Azure Subscription ID is required."
    //// Pass the validation with one of the methods below:
    // 1. Define in terraform.tfvars file
    // 2. export TF_VAR_azure_subscription_id="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  }
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "principal_object_id" {
  description = "Object ID of the user, group, or service principal to assign RBAC role"
  type        = string
}

variable "replication_type" {
  description = "LRS | ZRS | GRS | GZRS"
  type = string
  default = "GZRS"
}
