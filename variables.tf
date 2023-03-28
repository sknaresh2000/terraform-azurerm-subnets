variable "vnet_rg_name" {
  type        = string
  description = "The name of the resource group where the subnet should be created. This should be same as vnet resource group"
}

variable "name" {
  type        = string
  description = "The name of the resource group to create"
}

variable "location" {
  type        = string
  description = "Location where the NSG will be created"
  default     = "eastus"
}

variable "vnet_name" {
  type        = string
  description = "The name of the vnet where the subnet should be created"
}

variable "address_prefix" {
  type        = string
  description = "The address prefixes to use for the subnet"
}

variable "private_endpoint_network_policies_enabled" {
  type        = bool
  description = "Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy."
  default     = null
}

variable "delegation_details" {
  type = map(object({
    service_name = string
    actions      = list(string)
  }))
  description = "Delegation details for the created subnet"
  default     = null
}

variable "nsg_name" {
  type        = string
  description = "The name of the network security group that will be created along with subnet"
}

variable "nsg_rg_name" {
  type        = string
  description = "Name of the resource group where the nsg will be created"
}

variable "tags" {
  type        = map(any)
  description = "Mapping of tags"
}

variable "rt_table_id" {
  type        = string
  description = "Route table id that needs to be associated with this subnet"
  default     = null
}

variable "nsgrules" {
  type = map(object({
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = string
    destination_port_range       = string
    source_port_ranges           = string
    destination_port_ranges      = string
    source_address_prefix        = string
    destination_address_prefix   = string
    source_address_prefixes      = list(string)
    destination_address_prefixes = list(string)
  }))
  description = "NSG rules that will be created in the NSG associated with the subnet"
  default     = {}
}