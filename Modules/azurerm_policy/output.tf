# output "policy_assignment_ids" {
#   value = {
#     for key, value in azurerm_resource_group_policy_assignment.preprod_policy :
#     key => value.id
#   }
# }

# output "policy_assignment_names" {
#   value = {
#     for key, value in azurerm_resource_group_policy_assignment.preprod_policy :
#     key => value.name
#   }
# }