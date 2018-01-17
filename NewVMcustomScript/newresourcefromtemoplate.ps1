New-AzureRmResourceGroup customscriptvm -Location southcentralus -force
New-AzureRmResourceGroupDeployment -ResourceGroupName customscriptvm `
 -TemplateFile 'C:\Users\acorona\OneDrive - Microsoft\Meetups\NewVMcustomScript\vmcustomscript.json' -TemplateParameterFile  'C:\Users\acorona\OneDrive - Microsoft\Meetups\NewVMcustomScript\vmcustomscript.parameters.json'