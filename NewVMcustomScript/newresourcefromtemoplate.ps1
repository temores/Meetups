New-AzureRmResourceGroup customscriptvm -Location southcentralus -force
New-AzureRmResourceGroupDeployment -ResourceGroupName customscriptvm `
 -TemplateFile 'C:\Users\acorona\OneDrive - Microsoft\TSP\Meetups\Jan2018\vmcustomscript.json' -TemplateParameterFile 'C:\Users\acorona\OneDrive - Microsoft\TSP\Meetups\Jan2018\vmcustomscript.parameters.json'