resource "azurerm_resource_group" "demo" {
  name     = "rg-${var.environment}-finops-demo"
  location = var.location
}

resource "azurerm_virtual_network" "demo" {
  name                = "vnet-${var.environment}-finops-demo"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name    
}

resource "azurerm_subnet" "demo" {
  name                 = "subnet-${var.environment}-finops-demo"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "demo" {
    name                = "nic-${var.environment}-oversided"
    location            = var.location
    resource_group_name = azurerm_resource_group.demo.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.demo.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.unused.id
    }
}

resource "azurerm_public_ip" "unused" {
    name               = "pip-${var.environment}-finops-demo-unused"
    location           = var.location
    resource_group_name = azurerm_resource_group.demo.name
    allocation_method  = "Static"
    sku                = "Standard"
}

resource "azurerm_linux_virtual_machine" "oversized" {
    name               = "vm-${var.environment}-oversized"
    resource_group_name = azurerm_resource_group.demo.name
    location           = var.location
    size               = "Standard_F2"
    admin_username     = "azureadmin"

    network_interface_ids = [
        azurerm_network_interface.demo.id,
    ]

    admin_ssh_key {
        username   = "azureadmin"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
}

resource "azurerm_storage_account" "demo" {
  name                     = "stfinopsdemo${random_integer.rand.result}"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}