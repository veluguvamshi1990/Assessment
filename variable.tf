variable "location" {
  type = string
  description = "Azure region for deployment"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "app_service_name" {
  type = string
  description = "Name of the App Service"
}

variable "app_service_plan_name" {
  type = string
  description = "Name of the App Service plan"
}

variable "app_service_plan_sku" {
  type = string
  description = "SKU tier and size for the App Service plan (e.g., B1, S1)"
}

variable "app_service_plan_size" {
  type = string
  description = "Optional size for the App Service plan (defaults to F1)"
  default = "F1"
}

variable "app_settings" {
  type = map(string)
  description = "Map of key-value pairs for app settings (Optional)"
  default = {}  # Set an empty map as default
}

variable "connection_strings" {
  type = map(string)
  description = "Map of key-value pairs for connection strings (Optional)"
  default = {}  # Set an empty map as default
}
