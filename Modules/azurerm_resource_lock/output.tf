# Exposes the IDs of all Pre-Production resource locks for downstream module references.
output "resource_lock_ids" {
  value = {
    for key, value in azurerm_management_lock.preprod_resource_locks :
    key => value.id
  }
}

# Exposes the names of all Pre-Production resource locks for downstream module references.
output "resource_lock_names" {
  value = {
    for key, value in azurerm_management_lock.preprod_resource_locks :
    key => value.name
  }
}