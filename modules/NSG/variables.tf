variable "name" {
  description = "name of the nsg"
  type        = string
}

variable "location" {
  description = "location of nsg"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "tags" {
  description = "tag for nsg"
  type        = map(string)
  default     = {}
}