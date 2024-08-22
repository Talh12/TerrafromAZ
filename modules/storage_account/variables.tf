variable "name" {
    description = "the name of the storage account"
    type = string
}

variable "location" {
    description = "the location of the stroage account"
    type = string
}

variable "resource_group_name" {
    description = "the name of the resource group"
    type = string
}

variable "account_tier" {
    description = "account tier"
    type = string
}

variable "account_replication_type" {
    description = "account replication type"
    type = string
  
}