output "resource_group_ids" {
  value = module.preprod-modules-rgs.resource_group_ids
}
output "resource_group_names" {
  value = module.preprod-modules-rgs.resource_group_names
}

output "virtual_network_ids" {
  value = module.preprod-modules-vnets.virtual_network_ids
}

output "virtual_network_names" {
  value = module.preprod-modules-vnets.virtual_network_names # virtual_network_names or virtual_network_ids Ye child module mein tumne jo output ka naam diya hai ye output "virtual_network_names" {, wahi hai. aur kisi bhi resource ko bana rhe ho to output aise hi likha jaega
}

output "subnets_names" {
  value = module.preprod-modules-vnets.subnets_names
}

output "subnets_ids" {
  value = module.preprod-modules-vnets.subnets_ids
}

output "network_security_group_ids" {
  value = module.preprod-modules-nsgs.network_security_group_ids
}

output "network_security_group_names" {
  value = module.preprod-modules-nsgs.network_security_group_names
}

output "nat_gateway_ids" {
  value = module.preprod-modules-nat-gateways.nat_gateway_ids
}

output "nat_gateway_names" {
  value = module.preprod-modules-nat-gateways.nat_gateway_names
}

output "network_interface_ids" {
  value = module.preprod-modules-nics.network_interface_ids
}

output "network_interface_names" {
  value = module.preprod-modules-nics.network_interface_names
}

output "virtual_machine_ids" {
  value = module.preprod-modules-vms.virtual_machine_ids
}

output "virtual_machine_names" {
  value = module.preprod-modules-vms.virtual_machine_names
}

output "bastion_ids" {
  value = module.preprod-modules-bastion.bastion_ids
}

output "bastion_names" {
  value = module.preprod-modules-bastion.bastion_names
}

output "key_vault_ids" {
  value = module.preprod-modules-key-vaults.key_vault_ids
}

output "key_vault_names" {
  value = module.preprod-modules-key-vaults.key_vault_names
}

output "key_vault_uris" {
  value = module.preprod-modules-key-vaults.key_vault_uris
}

output "log_analytics_ids" {
  value = module.preprod-modules-log-analytics.log_analytics_ids
}

output "log_analytics_names" {
  value = module.preprod-modules-log-analytics.log_analytics_names
}

output "monitoring_ids" {
  value = module.preprod-modules-monitoring.monitoring_ids
}

output "monitoring_names" {
  value = module.preprod-modules-monitoring.monitoring_names
}