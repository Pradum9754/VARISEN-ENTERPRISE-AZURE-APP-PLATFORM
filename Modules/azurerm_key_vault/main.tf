# Retrieves the current Azure client configuration to obtain the tenant ID.
data "azurerm_client_config" "current" {}

# Creates Pre-Production Azure Key Vault resources using the provided configuration.
resource "azurerm_key_vault" "preprod_key_vaults" {
  for_each = var.preprod-key-vaults
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  # Associates the Key Vault with the current Azure tenant.
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = each.value.sku_name
  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled   = each.value.purge_protection_enabled
  rbac_authorization_enabled = each.value.enable_rbac_authorization
  tags = each.value.tags
}