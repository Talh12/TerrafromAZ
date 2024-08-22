output "function_app_id" {
  value = azurerm_function_app.function_app.id
}

output "function_app_default_hostname" {
  value = azurerm_function_app.function_app.default_hostname
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.app_service_plan.id
}
