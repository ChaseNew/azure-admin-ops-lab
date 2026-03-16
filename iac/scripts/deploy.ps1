# deploy.ps1
# This script logs into Azure, creates a resource group,
# and deploys the Bicep template using parameters.json.

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
