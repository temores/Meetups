New-AzureRmResourceGroupDeployment -ResourceGroupName templateEnhancements `
 -TemplateUri https://github.com/Azure/azure-quickstart-templates/blob/master/101-vm-simple-windows/azuredeploy.json `
 -TemplateParameterUri https://github.com/Azure/azure-quickstart-templates/blob/master/101-vm-simple-windows/azuredeploy.parameters.json