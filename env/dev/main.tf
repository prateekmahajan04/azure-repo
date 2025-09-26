module "rg" {
  source = "../../module/rg"

  rg = {
    for i in range(var.rg_count) :
    "rg${i}" => {
      name     = "${var.rg_prefix}${i}"
      location = var.location
    } if !(contains(var.rg_exclude, i))
  }

  tags = var.tags
}