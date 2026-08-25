# locals {
#   scopes = merge(
#     {
#       for key, id in var.resource_group_ids :
#       "resource_group.${key}" => id
#     },
#     {
#       for key, id in var.virtual_machine_ids :
#       "virtual_machine.${key}" => id
#     },
#     {
#       for key, id in var.key_vault_ids :
#       "key_vault.${key}" => id
#     },
#     {
#       for key, id in var.bastion_ids :
#       "bastion.${key}" => id
#     }
#   )
# }

# resource "azurerm_role_assignment" "preprod_role_assignments" {
#   for_each = var.preprod-role-assignments

#   name = each.value.name

#   scope = local.scopes[
#     "${each.value.scope_type}.${each.value.scope_key}"
#   ]

#   role_definition_name = each.value.role_definition_name
#   principal_id         = each.value.principal_id
#   principal_type       = each.value.principal_type

#   description = each.value.description
# }