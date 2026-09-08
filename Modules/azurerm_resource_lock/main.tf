# Builds a unified scope map for Resource Groups, Virtual Networks, Virtual Machines,
# Key Vaults, and Bastion resources used by the management lock configuration.
locals {
  scopes = merge(
    {
      for key, id in var.resource_group_ids :
      "resource_group.${key}" => id
    },
    {
      for key, id in var.virtual_network_ids :
      "virtual_network.${key}" => id
    },
    {
      for key, id in var.virtual_machine_ids :
      "virtual_machine.${key}" => id
    },
    {
      for key, id in var.key_vault_ids :
      "key_vault.${key}" => id
    },
    {
      for key, id in var.bastion_ids :
      "bastion.${key}" => id
    }
  )
}

# Creates Pre-Production Azure Management Locks for protecting configured resources.
resource "azurerm_management_lock" "preprod_resource_locks" {
  for_each = var.preprod-resource-locks
  name = each.value.name

  # Resolves the target resource scope from the unified scope map.
  scope = local.scopes[
    "${each.value.scope_type}.${each.value.scope_key}"
  ]

  lock_level = each.value.lock_level
  notes      = each.value.notes
}