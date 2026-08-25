# Network Address Translation Gateway
# Private subnet ke resources ko outbound (bahar jaane wali) public internet connectivity dena
# NAT Gateway = Private subnet ke resources ko Internet par bahar jaane ka controlled रास्ता, bina unko public IP diye.

#   sku_name                = "Standard"
#   zones                   = ["1"]
# Toh tumhare production setup mein final:
# sku_name = "StandardV2"
# zones mat do.

#   idle_timeout_in_minutes = 10
# Matlab:

# Activity ho rahi hai → connection chalta rahega ✅
# 10 minutes tak koi activity nahi → connection close ho jayega ❌


resource "azurerm_nat_gateway" "preprod-nat-gateways" {
    for_each = var.preprod-nat-gateway
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  zones                   = each.value.zones
}