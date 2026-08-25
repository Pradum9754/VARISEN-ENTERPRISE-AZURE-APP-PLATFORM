output "network_security_group_ids" {
  value = { for k, nsg in azurerm_network_security_group.preprod-nsgs : k => nsg.id }
}

output "network_security_group_names" {
  value = { for k, nsg in azurerm_network_security_group.preprod-nsgs : k => nsg.name }
}