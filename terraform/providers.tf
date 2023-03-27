terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "f693f291-3bd0-4038-861c-56769a6e0a28"
  tenant_id         = "96048087-a382-4fc0-a029-273ce64d679b"
  client_id         = "eca753f0-59f4-4f30-b3c7-eebdc03eb1da"
  client_secret     = "wLu8Q~xacOML3x2pAOInyGaFNwTZ4w._PqBvWb4d"
}