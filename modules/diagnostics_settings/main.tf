resource "azurerm_monitor_diagnostic_setting" "tal_ds" {
  name               = var.name
  target_resource_id = var.target_resource_id

  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "FunctionAppLogs"
    
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
