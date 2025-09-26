resource "azurerm_key_vault_secret" "secret" {
  for_each   = var.secret_map
  name       = each.value.secret_name
  value      = each.value.secret_value
  key_vault_id = each.value.kv_id
}


