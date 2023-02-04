variable "rg_name" {
  type        = string
  description = "The name of the resource group where the resources should be created"
}

variable "name" {
  type        = string
  description = "The name of the resource group to create"
}

variable "vnet_name" {
  type        = string
  description = "The name of the vnet where the subnet should be created"
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet"
}
