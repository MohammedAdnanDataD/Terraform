terraform{
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "3.0.0"
      }
    }
    
}

provider "azurerm"{
  subscription_id= var.subscription_id
  tenant_id = var.tenant_id
  features {}
}

#ADF
resource "azure_rm_data_factory" "adf" {
  name = var.adf_name
  resource_group_name=var.rg_name
}

#ADB
resource "azurerm_databricks_workspace" "adb" {
  name                = var.adb_name
  resource_group_name = var.rg_name
  location            = var.region
  sku                 = var.databricks_sku
}

#ADLS
# resource "azurerm_resource_group" "adls" {
#   name     = "example-resources"
#   location = "West Europe"
# }

# resource "azurerm_storage_account" "adls" {
#   name                     = "examplestorageacc"
#   resource_group_name      = azurerm_resource_group.adls.cmd
#   location                 = azurerm_resource_group.adls.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   account_kind             = "StorageV2"
#   is_hns_enabled           = "true"
# }

# resource "azurerm_storage_data_lake_gen2_filesystem" "adls" {
#   name               = "adls"
#   storage_account_id = azurerm_storage_account.adls.id

#   properties = {
#     hello = "aGVsbG8="
#   }
# }