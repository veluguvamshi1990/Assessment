Clone the repository: Use Git to clone the Terraform code repository containing your .tf files onto your local machine. git clone https://github.com/veluguvamshi1990/Assessment.git
Install Terraform: Ensure you have Terraform installed and configured on your local machine.
Configure Variables:
Edit the variables.tf file to provide your desired values for each variable. Here's a breakdown of the variables:
| Variable Name | Description | Default Value |
|---|---|---|
| location | Azure region for deployment | (Required) |
| resource_group_name | Name of the resource group | (Required) |
| app_service_name | Name for your App Service | (Required) |
| app_service_plan_name | Name for the App Service plan | (Required) |
| app_service_plan_sku | SKU tier for the App Service plan (e.g., "B1", "S1") | (Required) |
| app_service_plan_size | Size for the App Service plan (Optional, defaults to "F1") | |
| app_settings | Map of key-value pairs for app settings (Optional) | {} (empty map) |
| connection_strings | Map of key-value pairs for connection strings (Optional) | {} (empty map) |

Initialize Terraform by running the command terraform init
Validate and Deploy terraform code by running the commnads terraform validate and terraform plan
Terraform configuration and displays the changes that will be made if we run terraform apply

