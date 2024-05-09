provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  default = "myResourceGroup"
}

variable "location" {
  default = "West Europe"
}

variable "storage_account_name" {
  default = "mystorageaccount"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}