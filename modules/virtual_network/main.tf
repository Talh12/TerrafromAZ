resource "azurerm_virtual_network" "tal_vn" {
    name = var.name
    location = var.locaation
    resource_group_name = var.resource_group_name
    address_space = var.address_space
  
}