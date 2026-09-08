output "resource_group_ids" {
  value = { for k, rg in azurerm_resource_group.preprod-rgs : k => rg.id }
}
output "resource_group_names" {
  value = { for k, rg in azurerm_resource_group.preprod-rgs : k => rg.name }
}

# k => rg.id
# preprod-rg1 khud key hai k

# MAIN PART
#   for k, rg in azurerm_resource_group.preprod-rgs :
#   "preprod-rg1" => rg.id

# "Har resource ke liye uski key ko key bana aur uska ID value bana."

# Hum k = preprod-rg1 isliye nahi likh rahe kyunki k khud variable hai, aur Terraform automatically k mein har item ki key daal deta hai.