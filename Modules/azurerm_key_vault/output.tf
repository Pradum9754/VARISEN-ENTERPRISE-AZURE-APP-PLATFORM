# Exposes the IDs of all Pre-Production Key Vaults for downstream module references.
output "key_vault_ids" {
  value = {
    for k, kv in azurerm_key_vault.preprod_key_vaults :
    k => kv.id
  }
}

# Exposes the names of all Pre-Production Key Vaults for downstream module references.
output "key_vault_names" {
  value = {
    for k, kv in azurerm_key_vault.preprod_key_vaults :
    k => kv.name
  }
}

# Exposes the Vault URIs of all Pre-Production Key Vaults for downstream module references.
output "key_vault_uris" {
  value = {
    for k, kv in azurerm_key_vault.preprod_key_vaults :
    k => kv.vault_uri
  }
}