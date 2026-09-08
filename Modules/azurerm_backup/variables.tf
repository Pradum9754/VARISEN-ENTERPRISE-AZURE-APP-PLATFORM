# variable "preprod-backup" {
#   description = "Preprod Azure Backup configuration"

#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string

#     vm_keys = list(string)

#     backup_policy = object({
#       name                = string
#       frequency            = string
#       time                 = string
#       retention_daily_count = number
#       retention_weekly_count = number
#       retention_weekly_weekdays = list(string)
#       retention_weekly_time = string
#     })
#   }))
# }

# variable "virtual_machine_ids" {
#   description = "VM IDs from VM module"

#   type = map(string)
# }