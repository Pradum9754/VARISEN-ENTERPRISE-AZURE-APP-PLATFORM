# resource "azurerm_recovery_services_vault" "preprod_backup" {
#   for_each = var.preprod-backup

#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   sku = "Standard"

#   soft_delete_enabled = true
#   storage_mode_type   = "GeoRedundant"
# }

# resource "azurerm_backup_policy_vm" "preprod_backup_policy" {
#   for_each = var.preprod-backup

#   name                = each.value.backup_policy.name
#   resource_group_name = each.value.resource_group_name
#   recovery_vault_name = azurerm_recovery_services_vault.preprod_backup[each.key].name

#   timezone = "UTC"

#   backup {
#     frequency = each.value.backup_policy.frequency
#     time      = each.value.backup_policy.time
#   }

#   retention_daily {
#     count = each.value.backup_policy.retention_daily_count
#   }

#   retention_weekly {
#     count    = each.value.backup_policy.retention_weekly_count
#     weekdays = each.value.backup_policy.retention_weekly_weekdays
#     time     = each.value.backup_policy.retention_weekly_time
#   }
# }

# locals {
#   backup_vms = flatten([
#     for backup_key, backup in var.preprod-backup : [
#       for vm_key in backup.vm_keys : {
#         backup_key = backup_key
#         vm_key     = vm_key
#       }
#     ]
#   ])
# }

# resource "azurerm_backup_protected_vm" "preprod_backup_vms" {
#   for_each = {
#     for item in local.backup_vms :
#     "${item.backup_key}-${item.vm_key}" => item
#   }

#   resource_group_name = var.preprod-backup[
#     each.value.backup_key
#   ].resource_group_name

#   recovery_vault_name = azurerm_recovery_services_vault.preprod_backup[
#     each.value.backup_key
#   ].name

#   source_vm_id = var.virtual_machine_ids[
#     each.value.vm_key
#   ]

#   backup_policy_id = azurerm_backup_policy_vm.preprod_backup_policy[
#     each.value.backup_key
#   ].id
# }