variable "name" {
    description = "name of the resource"
    type = string
}

variable "locaation" {
    description = "location of the resource"
    type = string
}

variable "resource_group_name" {
    description = "resource group name"
    type = string
}

variable "address_space" {
    description = "ip adresses space"
    type = list(string)
}

