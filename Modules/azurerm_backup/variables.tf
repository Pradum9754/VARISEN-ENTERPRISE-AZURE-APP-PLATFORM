# Defines the Pre-Production Azure Backup configuration consumed by the child backup module.
variable "preprod-backup" {
  description = "Preprod Azure Backup configuration"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    # Defines the VM keys for which backup configuration will be applied.
    vm_keys = list(string)

    # Defines the backup policy configuration for Pre-Production VMs.
    backup_policy = object({
      name                       = string
      frequency                  = string
      time                       = string
      retention_daily_count     = number
      retention_weekly_count    = number
      retention_weekly_weekdays = list(string)
      retention_weekly_time     = string
    })
  }))
}

# Receives VM IDs from the VM child module for backup resource associations.
variable "virtual_machine_ids" {
  description = "VM IDs from VM module"
  type = map(string)
}