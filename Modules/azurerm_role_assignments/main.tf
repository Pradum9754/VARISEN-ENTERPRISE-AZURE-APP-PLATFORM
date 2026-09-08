# Retrieves the current Azure AD client configuration to obtain the current user's object ID.
data "azuread_client_config" "current" {}

# Builds a unified scope map for Resource Groups, Virtual Machines, Key Vaults, and Bastion resources.
locals {
  scopes = merge(
    {
      for key, id in var.resource_group_ids :
      "resource_group.${key}" => id
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

# Creates Pre-Production Azure RBAC role assignments for the configured resource scopes.
resource "azurerm_role_assignment" "preprod_role_assignments" {
  for_each = var.preprod-role-assignments

  # Generates a deterministic UUID for the role assignment name.
  name = uuidv5(
    "6ba7b810-9dad-11d1-80b4-00c04fd430c8",
    each.value.name
  )

  # Resolves the target resource scope from the unified scope map.
  scope = local.scopes[
    "${each.value.scope_type}.${each.value.scope_key}"
  ]

  role_definition_name = each.value.role_definition_name

  # Assigns the role to the current Azure AD user's object ID.
  principal_id = data.azuread_client_config.current.object_id
  principal_type = "User"
  description = each.value.description
}