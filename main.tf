resource "azurerm_subnet" "subnet" {
  name                                      = var.name
  resource_group_name                       = var.vnet_rg_name
  virtual_network_name                      = var.vnet_name
  address_prefixes                          = [var.address_prefix]
  private_endpoint_network_policies_enabled = var.private_endpoint_network_policies_enabled
  dynamic "delegation" {
    for_each = var.delegation_details != null ? [1] : []
    content {
      name = each.key
      service_delegation {
        name    = each.value.service_name
        actions = each.value.actions
      }
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.nsg_rg_name
  tags                = var.tags
}

resource "azurerm_network_security_group_association" "nsg-subnet-association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_route_table_association" "subnet-routetable-association" {
  count          = var.rt_table_id != null ? 1 : 0
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = var.rt_table_id
}

resource "azurerm_network_security_rule" "nsg-rule" {
  for_each                     = local.nsg_rules
  name                         = each.key
  priority                     = local.nsg_rules[each.key].priority
  direction                    = local.nsg_rules[each.key].direction
  access                       = local.nsg_rules[each.key].access
  protocol                     = local.nsg_rules[each.key].protocol
  source_port_range            = local.nsg_rules[each.key].source_port_range
  destination_port_range       = local.nsg_rules[each.key].destination_port_range
  source_port_ranges           = local.nsg_rules[each.key].source_port_ranges
  destination_port_ranges      = local.nsg_rules[each.key].destination_port_ranges
  source_address_prefix        = local.nsg_rules[each.key].source_address_prefix
  destination_address_prefix   = local.nsg_rules[each.key].destination_address_prefix
  source_address_prefixes      = local.nsg_rules[each.key].source_address_prefixes
  destination_address_prefixes = local.nsg_rules[each.key].destination_address_prefixes
  resource_group_name          = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name  = azurerm_network_security_group.nsg.name
}

locals {
  nsg_rules = merge(var.nsgrules, local.default_rules)
  default_rules = {
    Subnet-In = {
      priority                     = 200
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "*"
      source_port_range            = "*"
      destination_port_range       = "*"
      source_address_prefix        = var.address_prefix
      destination_address_prefix   = var.address_prefix
      source_port_ranges           = null
      destination_port_ranges      = null
      source_address_prefixes      = null
      destination_address_prefixes = null
    }
    DenyAll-In = {
      priority                     = 4000
      direction                    = "Inbound"
      access                       = "Deny"
      protocol                     = "*"
      source_port_range            = "*"
      destination_port_range       = "*"
      source_address_prefix        = "*"
      destination_address_prefix   = "*"
      source_port_ranges           = null
      destination_port_ranges      = null
      source_address_prefixes      = null
      destination_address_prefixes = null
    }
    Subnet-Out = {
      priority                     = 200
      direction                    = "Outbound"
      access                       = "Allow"
      protocol                     = "*"
      source_port_range            = "*"
      destination_port_range       = "*"
      source_address_prefix        = var.address_prefix
      destination_address_prefix   = var.address_prefix
      source_port_ranges           = null
      destination_port_ranges      = null
      source_address_prefixes      = null
      destination_address_prefixes = null
    }
    DenyAll-Out = {
      priority                     = 4000
      direction                    = "Outbound"
      access                       = "Deny"
      protocol                     = "*"
      source_port_range            = "*"
      destination_port_range       = "*"
      source_address_prefix        = "*"
      destination_address_prefix   = "*"
      source_port_ranges           = null
      destination_port_ranges      = null
      source_address_prefixes      = null
      destination_address_prefixes = null
    }
  }
}