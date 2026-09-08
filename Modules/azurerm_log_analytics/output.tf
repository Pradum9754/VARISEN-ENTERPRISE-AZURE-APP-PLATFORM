# Exposes the IDs of all Pre-Production Log Analytics Workspaces for downstream module references.
output "log_analytics_ids" {
  value = {
    for k, workspace in azurerm_log_analytics_workspace.preprod_log_analytics :
    k => workspace.id
  }
}

# Exposes the names of all Pre-Production Log Analytics Workspaces for downstream module references.
output "log_analytics_names" {
  value = {
    for k, workspace in azurerm_log_analytics_workspace.preprod_log_analytics :
    k => workspace.name
  }
}