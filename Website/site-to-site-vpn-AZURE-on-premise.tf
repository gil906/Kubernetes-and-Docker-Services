# Define Azure provider
provider "azurerm" {
  features {}
}

# Define variables
variable "azure_subscription_id" {}
variable "azure_resource_group_name" {}
variable "azure_virtual_network_name" {}
variable "azure_subnet_name" {}
variable "azure_vpn_gateway_name" {}
variable "azure_vpn_gateway_public_ip_name" {}

variable "home_public_ip_address" {}
variable "home_network_cidr" {}
variable "shared_key" {}

# Create Azure Virtual Network Gateway
resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = var.azure_vpn_gateway_name
  location            = var.azure_location
  resource_group_name = var.azure_resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"

  active_active = false

  ip_configuration {
    name                          = "vpngwconfig1"
    public_ip_address_id          = azurerm_public_ip.vpn_gateway_public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.vnet_subnet.id
  }

  vpn_client_configuration {
    address_space = ["10.0.0.0/16"]
  }
}

# Create Azure Public IP for VPN Gateway
resource "azurerm_public_ip" "vpn_gateway_public_ip" {
  name                = var.azure_vpn_gateway_public_ip_name
  location            = var.azure_location
  resource_group_name = var.azure_resource_group_name
  allocation_method   = "Dynamic"
}

# Create Azure VPN Gateway Connection
resource "azurerm_virtual_network_gateway_connection" "vpn_connection" {
  name                       = "home-to-azure"
  location                   = var.azure_location
  resource_group_name        = var.azure_resource_group_name
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn_gateway.id
  vpn_type                   = "RouteBased"
  shared_key                 = var.shared_key

  local_network_gateway_address_space = [var.home_network_cidr]

  connection_protocol = "IKEv2"

  ipsec_policy {
    sa_lifetime_seconds = 27000
    ipsec_encryption    = "AES256"
    ipsec_integrity     = "SHA256"
    ike_encryption      = "AES256"
    ike_integrity       = "SHA256"
    dh_group            = "DHGroup2"
    pfs_group           = "None"
  }
}
