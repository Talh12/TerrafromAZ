resource "azurerm_route_table" "tal_rt" {
    name = var.name
    location = var.location
    resource_group_name = var.resource_group_name
  
}