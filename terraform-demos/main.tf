module "finops_demo_env" {
    source = "./modules/azure/finops_demo_env"
    location = var.location
    environment = var.environment
}

# Optional: Identities Management module
# module "identities_management" {
#     source = "./modules/azure/identities_management"
#     environment = var.environment
# }