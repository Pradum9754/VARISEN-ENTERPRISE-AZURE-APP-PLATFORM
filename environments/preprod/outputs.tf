# Resource Group IDs - Exposes the IDs of all Pre-Production Resource Groups.
output "resource_group_ids" {
  value = module.preprod-modules-rgs.resource_group_ids
}

# Resource Group Names - Exposes the names of all Pre-Production Resource Groups.
output "resource_group_names" {
  value = module.preprod-modules-rgs.resource_group_names
}

# Virtual Network IDs - Exposes the IDs of all Pre-Production Virtual Networks.
output "virtual_network_ids" {
  value = module.preprod-modules-vnets.virtual_network_ids
}

# Virtual Network Names - Exposes the names of all Pre-Production Virtual Networks.
output "virtual_network_names" {
  value = module.preprod-modules-vnets.virtual_network_names # virtual_network_names or virtual_network_ids Ye child module mein tumne jo output ka naam diya hai ye output "virtual_network_names" {, wahi hai. aur kisi bhi resource ko bana rhe ho to output aise hi likha jaega
}

# Subnet Names - Exposes the names of all Pre-Production Subnets.
output "subnets_names" {
  value = module.preprod-modules-vnets.subnets_names
}

# Subnet IDs - Exposes the IDs of all Pre-Production Subnets.
output "subnets_ids" {
  value = module.preprod-modules-vnets.subnets_ids
}

# Network Security Group IDs - Exposes the IDs of all Pre-Production Network Security Groups.
output "network_security_group_ids" {
  value = module.preprod-modules-nsgs.network_security_group_ids
}

# Network Security Group Names - Exposes the names of all Pre-Production Network Security Groups.
output "network_security_group_names" {
  value = module.preprod-modules-nsgs.network_security_group_names
}

# NAT Gateway IDs - Exposes the IDs of all Pre-Production NAT Gateways.
output "nat_gateway_ids" {
  value = module.preprod-modules-nat-gateways.nat_gateway_ids
}

# NAT Gateway Names - Exposes the names of all Pre-Production NAT Gateways.
output "nat_gateway_names" {
  value = module.preprod-modules-nat-gateways.nat_gateway_names
}

# Network Interface IDs - Exposes the IDs of all Pre-Production Network Interfaces.
output "network_interface_ids" {
  value = module.preprod-modules-nics.network_interface_ids
}

# Network Interface Names - Exposes the names of all Pre-Production Network Interfaces.
output "network_interface_names" {
  value = module.preprod-modules-nics.network_interface_names
}

# Virtual Machine IDs - Exposes the IDs of all Pre-Production Virtual Machines.
output "virtual_machine_ids" {
  value = module.preprod-modules-vms.virtual_machine_ids

}

# Virtual Machine Names - Exposes the names of all Pre-Production Virtual Machines.
output "virtual_machine_names" {
  value = module.preprod-modules-vms.virtual_machine_names
}

# Bastion IDs - Exposes the IDs of the Pre-Production Azure Bastion resources.
output "bastion_ids" {
  value = module.preprod-modules-bastion.bastion_ids
}

# Bastion Names - Exposes the names of the Pre-Production Azure Bastion resources.
output "bastion_names" {
  value = module.preprod-modules-bastion.bastion_names
}

# Key Vault IDs - Exposes the IDs of all Pre-Production Key Vault resources.
output "key_vault_ids" {
  value = module.preprod-modules-key-vaults.key_vault_ids
}

# Key Vault Names - Exposes the names of all Pre-Production Key Vault resources.
output "key_vault_names" {
  value = module.preprod-modules-key-vaults.key_vault_names
}

# Key Vault URIs - Exposes the URIs of all Pre-Production Key Vault resources.
output "key_vault_uris" {
  value = module.preprod-modules-key-vaults.key_vault_uris
}

# Log Analytics IDs - Exposes the IDs of the Pre-Production Log Analytics Workspaces.
output "log_analytics_ids" {
  value = module.preprod-modules-log-analytics.log_analytics_ids
}

# Log Analytics Names - Exposes the names of the Pre-Production Log Analytics Workspaces.
output "log_analytics_names" {
  value = module.preprod-modules-log-analytics.log_analytics_names
}

# Monitoring IDs - Exposes the IDs of the Pre-Production monitoring resources.
output "monitoring_ids" {
  value = module.preprod-modules-monitoring.monitoring_ids
}

# Monitoring Names - Exposes the names of the Pre-Production monitoring resources.
output "monitoring_names" {
  value = module.preprod-modules-monitoring.monitoring_names
}

# Recovery Services Vault IDs - Exposes the IDs of the Recovery Services Vaults used for Pre-Production backup.
output "backup_recovery_services_vault_ids" {
  value = module.preprod-modules-backup.recovery_services_vault_ids
}

# Recovery Services Vault Names - Exposes the names of the Recovery Services Vaults used for Pre-Production backup.
output "backup_recovery_services_vault_names" {
  value = module.preprod-modules-backup.recovery_services_vault_names
}

# Role Assignment IDs - Exposes the IDs of the Azure RBAC role assignments configured for Pre-Production resources.
output "modules_role_assignment_ids" {
  value = module.preprod-modules-role-assignments.role_assignment_ids
}

# Role Assignment Names - Exposes the names of the Azure RBAC role assignments configured for Pre-Production resources.
output "modules_role_assignment_names" {
  value = module.preprod-modules-role-assignments.role_assignment_names
}

# Policy Assignment IDs - Exposes the IDs of the Azure Policy assignments applied to Pre-Production resources.
output "modules_policy_assignment_ids" {
  value = module.preprod-modules-policy.policy_assignment_ids
}

# Policy Assignment Names - Exposes the names of the Azure Policy assignments applied to Pre-Production resources.
output "modules_policy_assignment_names" {
  value = module.preprod-modules-policy.policy_assignment_names
}

# Resource Lock IDs - Exposes the IDs of Resource Locks applied to protect Pre-Production resources.
output "modules_resource_lock_ids" {
  value = module.preprod-modules-resource-lock.resource_lock_ids
}

# Resource Lock Names - Exposes the names of Resource Locks applied to protect Pre-Production resources.
output "modules_resource_lock_names" {
  value = module.preprod-modules-resource-lock.resource_lock_names
}