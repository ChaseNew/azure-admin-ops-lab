# deploy.ps1
# Deploys the Azure infrastructure defined in the Bicep template.

# Login to Azure
Connect-AzAccount

# Variables
$resourceGroup = "portfolio-rg"
$location = "canadacentral"

# Create resource group
New-AzResourceGroup `
  -Name $resourceGroup `
  -Location $location

# Deploy infrastructure using Bicep
New-AzResourceGroupDeployment `
  -ResourceGroupName $resourceGroup `
  -TemplateFile "../iac/bicep/main.bicep" `
  -TemplateParameterFile "../iac/bicep/parameters.json"
