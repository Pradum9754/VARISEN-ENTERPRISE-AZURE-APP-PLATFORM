# Defines the Pre-Production Azure Monitor Diagnostic Settings configuration consumed by the child module.
variable "preprod-monitoring" {
  description = "Preprod Azure Monitor Diagnostic Settings"
  type = map(object({
    name   = string
    vm_key = string

    # Defines the diagnostic log categories to be enabled for the VM.
    logs = list(object({
      category = string
    }))

    # Defines the diagnostic metric categories to be enabled for the VM.
    metrics = list(object({
      category = string
    }))
  }))
}

# Receives Virtual Machine IDs from the VM child module for diagnostic setting association.
variable "virtual_machine_ids" {
  type = map(string)
}

# Receives the Log Analytics Workspace ID for centralized monitoring data collection.
variable "log_analytics_workspace_id" {
  type = string
}