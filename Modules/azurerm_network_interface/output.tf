output "network_interface_ids" {
  value = { for k, nic in azurerm_network_interface.preprod-nics : k => nic.id }
}

output "network_interface_names" {
  value = { for k, nic in azurerm_network_interface.preprod-nics : k => nic.name }
}