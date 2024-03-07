terraform{
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = ">=3.0.0"
      }
    }
    
}


provider "azurerm"{
  skip_provider_registration= true
  subscription_id= var.subscription_id
  tenant_id = var.tenant_id
  features {}
}

#ADF 
resource "azurerm_data_factory" "adf" {
  name = var.adfname
  location = var.region
  resource_group_name = var.rg_name
}
#ADB
resource "azurerm_databricks_workspace" "adb" {
  name                = var.adb_name
  resource_group_name = var.rg_name
  location            = var.region
  sku                 = var.databricks_sku
}

ADLS

## resource "azurerm_resource_group" "adls" {
##   name     = "example-ADLS"
##   location = var.region
## }

resource "azurerm_storage_account" "adls" {
  name                     = var.adls_name
  resource_group_name      = var.rg_name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "adls" {
  name               = "adls"
  storage_account_id = azurerm_storage_account.adls.id

  properties = {
    hello = "aGVsbG8="
  }
}

#Key Vault
resource "azurerm_key_vault" "KV"{
  name= var.kv_name
  resource_group_name= var.rg_name
  sku_name = "standard"
  tenant_id=var.tenant_id
  location=var.region
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Create",
    ]

    secret_permissions = [
      "Set",
    ]

    storage_permissions = [
      "Set",
    ]
  }
}
