# Creates Pre-Production Azure Monitor Diagnostic Settings for VM monitoring and log collection.
resource "azurerm_monitor_diagnostic_setting" "preprod_monitoring" {
  for_each = var.preprod-monitoring
  name = each.value.name

  # Associates the diagnostic setting with the corresponding Virtual Machine.
  target_resource_id = var.virtual_machine_ids[each.value.vm_key]

  # Sends diagnostic logs and metrics to the configured Log Analytics Workspace.
  log_analytics_workspace_id = var.log_analytics_workspace_id

  # Dynamically enables the configured diagnostic log categories.
  dynamic "enabled_log" {
    for_each = each.value.logs

    content {
      category = enabled_log.value.category
    }
  }

  # Dynamically enables the configured diagnostic metric categories.
  dynamic "enabled_metric" {
    for_each = each.value.metrics

    content {
      category = enabled_metric.value.category
    }
  }
}