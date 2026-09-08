# output "role_assignment_ids" {
#   value = {
#     for key, value in azurerm_role_assignment.preprod_role_assignments :
#     key => value.id
#   }
# }

# output "role_assignment_names" {
#   value = {
#     for key, value in azurerm_role_assignment.preprod_role_assignments :
#     key => value.name
#   }
# }