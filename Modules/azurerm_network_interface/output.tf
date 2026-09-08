# Exposes the IDs of all Pre-Production Network Interfaces for downstream module references.
output "network_interface_ids" {
  value = { for k, nic in azurerm_network_interface.preprod-nics : k => nic.id }
}

# Exposes the names of all Pre-Production Network Interfaces for downstream module references.
output "network_interface_names" {
  value = { for k, nic in azurerm_network_interface.preprod-nics : k => nic.name }
}