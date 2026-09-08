# Defines the Pre-Production Resource Group configuration consumed by the child module.
variable "preprod-rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string))
    managed_by = optional(string)
  }))
}