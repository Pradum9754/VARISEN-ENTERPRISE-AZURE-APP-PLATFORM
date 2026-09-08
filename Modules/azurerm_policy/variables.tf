# variable "preprod-policy" {
#   description = "Preprod Azure Policy configuration"

#   type = map(object({
#     name                  = string
#     display_name          = string
#     description           = optional(string)
#     policy_name           = string
#     scope_type            = string
#     scope_key             = string
#     enforcement_mode      = optional(string, "Default")
#     parameters            = optional(string)
#   }))
# }

# variable "resource_group_ids" {
#   type = map(string)
# }

# variable "virtual_network_ids" {
#   type = map(string)
# }

# variable "key_vault_ids" {
#   type = map(string)
# }