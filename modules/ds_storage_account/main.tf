resource "azurerm_monitor_diagnostic_setting" "storage_account_ds" {
  name                        = var.name
  target_resource_id          = "${var.target_resource_id}/blobServices/default/"
  log_analytics_workspace_id  = var.log_analytics_workspace_id

  enabled_log {
    category = "StorageWrite"
  }
}
