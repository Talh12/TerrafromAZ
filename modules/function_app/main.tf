resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${var.name}-asp"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "function_app" {
  name                      = "${var.name}-fa"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  storage_account_name      = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  app_service_plan_id       = azurerm_app_service_plan.app_service_plan.id

  app_settings = {
    "FUNCTIONS_EXTENSION_VERSION" = "~3"
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "AZURE_STORAGE_CONNECTION_STRING" = var.storage_account_connection_string
  }

  tags = {
    environment = "production"
  }
}
