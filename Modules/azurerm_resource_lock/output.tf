# output "resource_lock_ids" {
#   value = {
#     for key, value in azurerm_management_lock.preprod_resource_locks :
#     key => value.id
#   }
# }

# output "resource_lock_names" {
#   value = {
#     for key, value in azurerm_management_lock.preprod_resource_locks :
#     key => value.name
#   }
# }