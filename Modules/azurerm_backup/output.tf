# Exposes the IDs of all Pre-Production Recovery Services Vaults for consumption by the root module or other dependent modules.
output "recovery_services_vault_ids" {
  value = {
    for key, value in azurerm_recovery_services_vault.preprod_backup :
    key => value.id
  }
}

# Exposes the names of all Pre-Production Recovery Services Vaults for reference and downstream resource configuration.
output "recovery_services_vault_names" {
  value = {
    for key, value in azurerm_recovery_services_vault.preprod_backup :
    key => value.name
  }
}

# Exposes the IDs of all Pre-Production VM backup policies for downstream module references and resource associations.
output "backup_policy_ids" {
  value = {
    for key, value in azurerm_backup_policy_vm.preprod_backup_policy :
    key => value.id
  }
}

# Exposes the IDs of all Pre-Production protected virtual machines registered with Azure Backup.
output "backup_protected_vm_ids" {
  value = {
    for key, value in azurerm_backup_protected_vm.preprod_backup_vms :
    key => value.id
  }
}