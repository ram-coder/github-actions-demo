provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

data "azurerm_network_security_group" "target_nsg" {
  name                = "uksouth-nsg"
  resource_group_name = "prod-uksouth-rg"
}

resource "azurerm_network_security_rule" "rdp_rule" {
  name                        = "Allow-RDP-DynamicIP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = var.my_public_ip
  destination_address_prefix  = "*"
  network_security_group_name = data.azurerm_network_security_group.target_nsg.name
  resource_group_name         = data.azurerm_network_security_group.target_nsg.resource_group_name
} 
