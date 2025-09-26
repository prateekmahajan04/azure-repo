resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg_map
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  lifecycle { prevent_destroy = true }
}


