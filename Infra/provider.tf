
terraform {
  required_version = ">=1.5.1"

  required_providers {
    azurerm = {

        version = "3.74.0"
    }
  }
}
provider "azurerm" {
  features {}
}
#  backend "azurerm" {
#         resource_group_name  = "tfstate-dev"
#         storage_account_name = "testtfstatedev"
#         container_name       = "devtfstate"
#         key                  = "dev-test.tfstate"
#     }

