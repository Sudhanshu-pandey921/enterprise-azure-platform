module "resource_group" {
  source = "./infrastructure/modules/resource-group"

  name     = var.resource_group_name
  location = var.location

}

module "storage_account" {
  source = "./infrastructure/modules/storage-account"

  name                     = var.storage_account_name
  resource_group_name      = module.resource_group.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = "LRS"

  depends_on = [module.resource_group]
}

module "app_service_plan" {
  source = "./infrastructure/modules/app-service-plan"

  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  depends_on = [module.resource_group, module.storage_account]
}

module "app-service" {
  source = "./infrastructure/modules/app-service"

  app_service_name    = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = module.app_service_plan.service_plan_id

  depends_on = [module.resource_group, module.storage_account, module.app_service_plan]

}