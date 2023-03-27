//to create storage account CDN
locals{
  if_static_website_enabled = true ? [{}] : []
}
resource "azurerm_storage_account" "viralnationstorageacc" {
  name                      = "viralnationstorageacc"
  resource_group_name       = "sayeers"
  location                  = "eastus"
  account_tier             = "Standard"
  account_replication_type  = "GRS"

  dynamic "static_website" {
    for_each = local.if_static_website_enabled
    content {
      index_document     = "index.html"
    }
  }

}

resource "azurerm_cdn_profile" "vn_cdn_profile" {
  count               = 1
  name                = "vncdnprofile"
  resource_group_name = "sayeers"
  location            = "eastus"
  sku                 = "Standard_Verizon"

}

resource "azurerm_cdn_endpoint" "cdn-endpoint" {
  count                         = 1
  name                          = "vncdnprofile"
  profile_name                  = azurerm_cdn_profile.vn_cdn_profile.0.name
  location                      = "eastus"
  resource_group_name           = "sayeers"
  origin_host_header            = azurerm_storage_account.viralnationstorageacc.primary_web_host
  querystring_caching_behaviour = "IgnoreQueryString"

  origin {
    name      = "websiteorginaccount"
    host_name = azurerm_storage_account.viralnationstorageacc.primary_web_host
  }

}
