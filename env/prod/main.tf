# module "rg" {
#   source = "../../module/rg"

#   rg = {
#     for i in range(6, var.rg_count+6) :
#     "rg${i}" => {
#       name     = "${var.rg_prefix}${i}"
#       location = var.location
#     } if !(contains(var.rg_exclude, i))
#   }

#   tags = var.tags
# }