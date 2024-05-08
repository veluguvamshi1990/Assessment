output "app_service_id" {
  value = azurerm_app_service.app.id
  description = "ID of the deployed Azure App Service"
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.asp.id
  description = "ID of the deployed App Service plan"
}

output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
  description = "ID of the created virtual network"
}

output "subnet_id" {
  value = azurerm_virtual_network.vnet.subnet[0].id
  description = "ID of the subnet created for the App Service"
}

output "staging_environment_id" {
  value = azurerm_app_service_plan_staging_environment.staging.id
  description = "ID of the created staging environment"