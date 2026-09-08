output "log_analytics_ids" {
  value = {
    for k, workspace in azurerm_log_analytics_workspace.preprod_log_analytics :
    k => workspace.id
  }
}

output "log_analytics_names" {
  value = {
    for k, workspace in azurerm_log_analytics_workspace.preprod_log_analytics :
    k => workspace.name
  }
}
