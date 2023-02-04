output "id" {
  value       = azurerm_subnet.subnet.id
  description = "The id of the created subnet"
}

output "name" {
  value       = azurerm_subnet.subnet.name
  description = "The name of the created subnet"
}