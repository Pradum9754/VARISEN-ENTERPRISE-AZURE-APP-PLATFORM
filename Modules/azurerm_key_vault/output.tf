output "key_vault_ids" {
  value = {
    for k, kv in azurerm_key_vault.preprod_key_vaults :
    k => kv.id
  }
}

output "key_vault_names" {
  value = {
    for k, kv in azurerm_key_vault.preprod_key_vaults :
    k => kv.name
  }
}

output "key_vault_uris" {
  value = {
    for k, kv in azurerm_key_vault.preprod_key_vaults :
    k => kv.vault_uri
  }
}