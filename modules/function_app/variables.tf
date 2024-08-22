variable "name" {
  description = "function app name"
  type        = string
}

variable "location" {
  description = "resource group location"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "storage_account_name" {
  description = "storage account name"
  type        = string
}

variable "storage_account_access_key" {
  description = "storage account access key"
  type        = string
}

variable "app_service_plan_id" {
  description = "the id of the app service Plan"
  type        = string
}

variable "os_type" {
  description = "the operating system type"
  type        = string
}

variable "storage_account_connection_string" {
  description = "storage_account_connection_string"
  type = string 
}