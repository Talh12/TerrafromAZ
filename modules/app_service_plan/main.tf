resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.app_service_plan.id
}
