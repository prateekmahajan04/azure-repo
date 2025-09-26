resource "azurerm_public_ip" "pip" {
  for_each = var.pip_map
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  lifecycle { prevent_destroy = true }
}


