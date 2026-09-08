# Retrieves the Azure Policy definitions required for the configured Pre-Production policy assignments.
data "azurerm_policy_definition" "preprod_policy" {
  for_each = var.preprod-policy
  display_name = each.value.policy_name
}

# Retrieves the Resource Groups used as scopes for Pre-Production policy assignments.
data "azurerm_resource_group" "preprod_policy_rg" {
  for_each = {
    for key, value in var.preprod-policy :
    key => value
    if value.scope_type == "resource_group"
  }

  name = split(
    "/",
    var.resource_group_ids[each.value.scope_key]
  )[4]
}

# Builds a unified scope map from Resource Groups, Virtual Networks, and Key Vaults.
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
      for key, id in var.key_vault_ids :
      "key_vault.${key}" => id
    }
  )
}

# Creates Azure Policy assignments at the configured Pre-Production Resource Group scopes.
resource "azurerm_resource_group_policy_assignment" "preprod_policy" {
  for_each = {
    for key, value in var.preprod-policy :
    key => value
    if value.scope_type == "resource_group"
  }
  name                 = each.value.name
  display_name         = each.value.display_name
  description          = each.value.description
  policy_definition_id = data.azurerm_policy_definition.preprod_policy[each.key].id

  # Associates the policy assignment with the configured Resource Group scope.
  resource_group_id = local.scopes[
    "${each.value.scope_type}.${each.value.scope_key}"
  ]

  # Configures the allowed Azure location based on the target Resource Group location.
  parameters = jsonencode({
    listOfAllowedLocations = {
      value = [
        data.azurerm_resource_group.preprod_policy_rg[each.key].location
      ]
    }
  })
}