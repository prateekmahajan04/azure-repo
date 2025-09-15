terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }


  backend "azurerm" {
    resource_group_name  = "prateektfstatebackend"
    storage_account_name = "prateektfstatebackendstg"   # must be globally unique
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    
  }
  subscription_id = "3bcdc0e9-b6e4-470c-86a7-c19f6b5069c8"
}