variable "name" {
  description = "the name of the resource"
  type        = string
}

variable "resource_group_name" {
  description = "the name of the resource group"
  type        = string
}

variable "location" {
  description = "the location of the resource"
  type        = string
}

variable "virtual_network_name" {
  description = "the name of the virtual network"
  type = string
  
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}

variable "nsg_id" {
  description = "The id of the network security group"
  type        = string
}

variable "route_table_id" {
  description = "the id of the route table"
  type        = string
}
