# data "azurerm_policy_definition" "preprod_policy" {
#   for_each = var.preprod-policy

#   display_name = each.value.policy_name
# }

# locals {
#   scopes = merge(
#     {
#       for key, id in var.resource_group_ids :
#       "resource_group.${key}" => id
#     },
#     {
#       for key, id in var.virtual_network_ids :
#       "virtual_network.${key}" => id
#     },
#     {
#       for key, id in var.key_vault_ids :
#       "key_vault.${key}" => id
#     }
#   )
# }

# resource "azurerm_resource_group_policy_assignment" "preprod_policy" {
#   for_each = {
#     for key, value in var.preprod-policy :
#     key => value
#     if value.scope_type == "resource_group"
#   }

#   name                 = each.value.name
#   display_name         = each.value.display_name
#   description          = each.value.description
#   policy_definition_id = data.azurerm_policy_definition.preprod_policy[each.key].id
#   resource_group_id    = local.scopes[
#     "${each.value.scope_type}.${each.value.scope_key}"
#   ]

#   enforcement_mode = each.value.enforcement_mode

#   parameters = each.value.parameters
# }