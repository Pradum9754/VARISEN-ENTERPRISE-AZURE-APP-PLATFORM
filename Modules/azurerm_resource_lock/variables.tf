# variable "preprod-resource-locks" {
#   description = "Preprod Azure resource locks"

#   type = map(object({
#     name       = string
#     scope_type = string
#     scope_key  = string
#     lock_level = string
#     notes      = optional(string)
#   }))
# }

# variable "resource_group_ids" {
#   type = map(string)
# }

# variable "virtual_network_ids" {
#   type = map(string)
# }

# variable "virtual_machine_ids" {
#   type = map(string)
# }

# variable "key_vault_ids" {
#   type = map(string)
# }

# variable "bastion_ids" {
#   type = map(string)
# }