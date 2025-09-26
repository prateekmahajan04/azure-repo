resource "azurerm_subnet" "subnet" {
  for_each = var.subnet_map
  name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.prefix]

  lifecycle { prevent_destroy = true }
}


