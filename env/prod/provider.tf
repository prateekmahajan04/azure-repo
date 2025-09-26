terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "prateektfstatebackend"
    storage_account_name = "prateekbackendstrg" # must be globally unique
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "e5776277-6d0c-4f2c-97d3-a378ac7502d6"
}