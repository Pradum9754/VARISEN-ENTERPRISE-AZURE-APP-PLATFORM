# Exposes the IDs of all Pre-Production monitoring diagnostic settings for downstream module references.
output "monitoring_ids" {
  value = {
    for k, monitoring in azurerm_monitor_diagnostic_setting.preprod_monitoring :
    k => monitoring.id
  }
}

# Exposes the names of all Pre-Production monitoring diagnostic settings for downstream module references.
output "monitoring_names" {
  value = {
    for k, monitoring in azurerm_monitor_diagnostic_setting.preprod_monitoring :
    k => monitoring.name
  }
}