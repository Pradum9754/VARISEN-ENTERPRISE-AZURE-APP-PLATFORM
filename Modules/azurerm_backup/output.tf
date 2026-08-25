# output "recovery_services_vault_ids" {
#   value = {
#     for key, value in azurerm_recovery_services_vault.preprod_backup :
#     key => value.id
#   }
# }

# output "recovery_services_vault_names" {
#   value = {
#     for key, value in azurerm_recovery_services_vault.preprod_backup :
#     key => value.name
#   }
# }

# output "backup_policy_ids" {
#   value = {
#     for key, value in azurerm_backup_policy_vm.preprod_backup_policy :
#     key => value.id
#   }
# }

# output "backup_protected_vm_ids" {
#   value = {
#     for key, value in azurerm_backup_protected_vm.preprod_backup_vms :
#     key => value.id
#   }
# }