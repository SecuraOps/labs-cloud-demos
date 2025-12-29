module "finops_demo_env" {
    source = "./modules/azure/finops_demo_env"
    location = var.location
    environment = var.environment
}