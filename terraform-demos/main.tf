module "finops_demo_env" {
    source = "./modules/azure/finops_demo_env"
    location = var.location
    environment = var.environment
}

# Optional: Identities Management module
module "identities_management" {
    source = "./modules/azure/identities_management"
    environment = var.environment
    location = var.location
    principal_object_id = var.principal_object_id
    azure_subscription_id = var.azure_subscription_id
}

module "storage" {
    source = "./modules/azure/storage"
    replication_type = var.replication_type
}