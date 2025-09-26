data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each  = var.kv_map
  name      = each.value.kv_name
  resource_group_name = each.value.rg_name
  location  = each.value.location
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  lifecycle { prevent_destroy = true }
}

output "kv_id" {
  value = { for k, v in azurerm_key_vault.kv : k => v.id }
}
