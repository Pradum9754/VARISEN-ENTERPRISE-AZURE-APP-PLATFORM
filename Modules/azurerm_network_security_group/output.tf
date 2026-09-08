# Exposes the IDs of all Pre-Production Network Security Groups for downstream module references.
output "network_security_group_ids" {
  value = { for k, nsg in azurerm_network_security_group.preprod-nsgs : k => nsg.id }
}

# Exposes the names of all Pre-Production Network Security Groups for downstream module references.
output "network_security_group_names" {
  value = { for k, nsg in azurerm_network_security_group.preprod-nsgs : k => nsg.name }
}