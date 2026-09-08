# Exposes the IDs of all Pre-Production NAT Gateways for downstream module references.
output "nat_gateway_ids" {
  value = { for k, nat in azurerm_nat_gateway.preprod-nat-gateways : k => nat.id }
}

# Exposes the names of all Pre-Production NAT Gateways for downstream module references.
output "nat_gateway_names" {
  value = { for k, nat in azurerm_nat_gateway.preprod-nat-gateways : k => nat.name }
}