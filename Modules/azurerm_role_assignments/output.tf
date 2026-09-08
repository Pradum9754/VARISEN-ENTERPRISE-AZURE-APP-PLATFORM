# Exposes the IDs of all Pre-Production RBAC role assignments for downstream module references.
output "role_assignment_ids" {
  value = {
    for key, value in azurerm_role_assignment.preprod_role_assignments :
    key => value.id
  }
}

# Exposes the names of all Pre-Production RBAC role assignments for downstream module references.
output "role_assignment_names" {
  value = {
    for key, value in azurerm_role_assignment.preprod_role_assignments :
    key => value.name
  }
}