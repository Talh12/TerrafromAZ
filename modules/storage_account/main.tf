resource "azurerm_storage_account" "sa1" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "static_website_container" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.sa1.name
  container_access_type = "container"
}

resource "azurerm_storage_blob" "frontend_files" {
  for_each = fileset("${path.module}/../../frontend", "**/*")

  name                   = each.key
  storage_account_name   = azurerm_storage_account.sa1.name
  storage_container_name = azurerm_storage_container.static_website_container.name
  type                   = "Block"
  source                 = "${path.module}/../../frontend/${each.key}"
}

