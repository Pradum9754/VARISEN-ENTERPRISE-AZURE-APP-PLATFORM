output "nat_gateway_ids" {
  value = { for k, nat in azurerm_nat_gateway.preprod-nat-gateways : k => nat.id }
}

output "nat_gateway_names" {
  value = { for k, nat in azurerm_nat_gateway.preprod-nat-gateways : k => nat.name }
}