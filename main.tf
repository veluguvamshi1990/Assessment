# Configure Azure Provider
provider "azurerm" {
  features {}
}

# Define Variables (reference variables.tf)
variable "location" {}
variable "resource_group_name" {}
variable "app_service_name" {}
variable "app_service_plan_name" {}
variable "app_service_plan_sku" {}
variable "app_settings" {}
variable "connection_strings" {}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "appsvc-${var.app_service_name}-vnet"  # Add prefix for clarity
  location             = var.location
  address_space       = ["10.0.0.0/16"]

  subnet {
    name                 = "appsvc-${var.app_service_name}-subnet"
    address_prefixes     = ["10.0.1.0/24"]  # Adjust based on needs
    depends_on           = [azurerm_app_service_virtual_network_swift_connection.delegate]  # Delegation dependency
  }
}

#Create App Service Plan
resource "azurerm_app_service_plan" "asp" {
  name                = "appsvc-${var.app_service_plan_name}"  # Add prefix for clarity
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  sku {
    tier = var.app_service_plan_sku
    size = var.app_service_plan_size  # Use separate variable for size
  }
}

# Create App Service with Virtual Network Integration
resource "azurerm_app_service" "app" {
  name                  = var.app_service_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  app_service_plan_id   = azurerm_app_service_plan.asp.id

  # Configure App settings and connection strings (if provided)
  app_settings = var.app_settings == {} ? null : var.app_settings
  connection_strings = var.connection_strings == {} ? null : var.connection_strings

  # Enable virtual network integration
  depends_on = [azurerm_virtual_network.vnet]
  subnet_id = azurerm_virtual_network.vnet.subnet[0].id
}

# Create App Service Staging Slot
resource "azurerm_app_service_plan_staging_environment" "staging" {
  app_service_plan_id = azurerm_app_service_plan.asp.id
  name                 = "appsvc-${var.app_service_name}-staging"  # Add prefix for clarity
  staging_enabled      = true
}

resource "azurerm_app_service_virtual_network_swift_connection" "delegate" {
  name                 = "appsvc-${var.app_service_name}-delegate"  # Add prefix for clarity
  app_service_name      = azurerm_app_service.app.name  # Use App Service name for delegation
}