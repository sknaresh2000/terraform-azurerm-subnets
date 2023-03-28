output "id" {
  value       = azurerm_subnet.subnet.id
  description = "The id of the created subnet"
}

output "name" {
  value       = azurerm_subnet.subnet.name
  description = "The name of the created subnet"
}

output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "The id of the network security group"
}