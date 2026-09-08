# resource "azurerm_log_analytics_workspace" "preprod_log_analytics" {
#   for_each = var.preprod-log-analytics

#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   sku               = each.value.sku
#   retention_in_days = each.value.retention_in_days

#   tags = each.value.tags
# }

resource "azurerm_monitor_diagnostic_setting" "preprod_monitoring" {
  for_each = var.preprod-monitoring

  name = each.value.name

  target_resource_id = var.virtual_machine_ids[each.value.vm_key]

  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = each.value.logs

    content {
      category = enabled_log.value.category
    }
  }

  dynamic "enabled_metric" {
    for_each = each.value.metrics

    content {
      category = enabled_metric.value.category
    }
  }
}