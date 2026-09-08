# Exposes the IDs of all Pre-Production Azure Policy assignments for downstream module references.
output "policy_assignment_ids" {
  value = {
    for key, value in azurerm_resource_group_policy_assignment.preprod_policy :
    key => value.id
  }
}

# Exposes the names of all Pre-Production Azure Policy assignments for downstream module references.
output "policy_assignment_names" {
  value = {
    for key, value in azurerm_resource_group_policy_assignment.preprod_policy :
    key => value.name
  }
}