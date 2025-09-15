# module "rg" {
#   source = "../../module/rg"
#   rg     = var.rg
# }

resource "azurerm_resource_group" "rg" {
  # for_each = var.rg
  name     = "rg1"
  location = "eastus"
}
