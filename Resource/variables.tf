variable "environment" {
  type = string
}
variable "region" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "region_code_name"{
    type = string
}
variable "rg_name"{
    type = string
}

#ADF
variable "adfname"{
    type = string
}

#ADB
variable "adb_name"{
    type = string
}
variable "databricks_sku"{
    type = string
}

#ADLS
variable "adls_name"{
    type = string
}

#KeyVault
variable "kv_name"{
  type= string
}
variable "object_id"{
  type= string
}
