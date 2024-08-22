output "azurerm_storage_account_name" {
  value = azurerm_storage_account.sa1.name
}

output "storage_account_access_key" {
  value = azurerm_storage_account.sa1.primary_access_key
}

output "azurerm_storage_account_location" {
  value = azurerm_storage_account.sa1.location
}

output "primary_endpoint" {
  value = azurerm_storage_account.sa1.primary_web_endpoint
}

output "storage_account_id" {
  value = azurerm_storage_account.sa1.id
  
}

output "storage_account_connection_string" {
  value = azurerm_storage_account.sa1.primary_connection_string
}
