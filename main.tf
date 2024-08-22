provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = "az-rg"
  location = "West Europe"
}

module "log_analytics_workspace" {
  source              = "./modules/log_analytics_workspace"
  name                = "tal-log-analytics"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "diagnostics_settings" {
  source                   = "./modules/diagnostics_settings"
  name                     = "tal-ds"
  target_resource_id       = module.function_app.function_app_id
  log_analytics_workspace_id = module.log_analytics_workspace.log_analytics_workspace_id
}

module "diagnostics_settings_storage_account" {
  source                   = "./modules/ds_storage_account"
  name                     = "tal-ds-storage-account"
  target_resource_id       = module.storage_account.storage_account_id
  log_analytics_workspace_id = module.log_analytics_workspace.log_analytics_workspace_id
}

module "storage_account" {
  source                   = "./modules/storage_account"
  name                     = "talsa7"
  location                 = module.resource_group.location
  resource_group_name      = module.resource_group.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "app_service_plan" {
  source              = "./modules/app_service_plan"
  name                = "my-app-service-plan"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "function_app" {
  source                     = "./modules/function_app"
  name                       = "TalsFunctionApp"
  location                   = module.resource_group.location
  resource_group_name        = module.resource_group.name
  storage_account_name       = module.storage_account.azurerm_storage_account_name
  storage_account_access_key = module.storage_account.storage_account_access_key
  app_service_plan_id        = module.app_service_plan.app_service_plan_id
  os_type = "linux"
  storage_account_connection_string = module.storage_account.storage_account_connection_string
}

module "nsg" {
  source = "./modules/NSG"
  name = "tals_nsg"
  location = module.resource_group.location
  resource_group_name = module.resource_group.name 
}

module "virtual_network" {
  source = "./modules/virtual_network"
  name = "tal_vn"
  locaation = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space = ["10.0.0.0/16"]
  
}
module "route_table" {
  source = "./modules/route_table"
  name = "tal_rt"
  location = module.resource_group.location
  resource_group_name = module.resource_group.name
  
}

module "subnet" {
  source = "./modules/subnet"
  name = "tals_subnet"
  location = module.resource_group.location
  resource_group_name = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  nsg_id = module.nsg.nsg_id
  route_table_id = module.route_table.route_table_id
  address_prefixes = ["10.0.0.0/24"]
}

