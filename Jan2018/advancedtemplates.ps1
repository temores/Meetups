#az group deployment create --resource-group asdf --template-uri https://raw.githubusercontent.com/rjmax/Build2017/master/Act1.TemplateEnhancements/Chapter01.Functions.json


New-AzureRmResourceGroup -Name templateEnhancements -Location southcentralus -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName templateEnhancements -TemplateUri https://raw.githubusercontent.com/rjmax/Build2017/master/Act1.TemplateEnhancements/Chapter01.Functions.json

New-AzureRmResourceGroup -Name copyProperties -Location southcentralus -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName copyProperties -TemplateUri https://raw.githubusercontent.com/rjmax/Build2017/master/Act1.TemplateEnhancements/Chapter02.PropertyCopies.json

New-AzureRmResourceGroup -Name serialCopies -Location southcentralus -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName serialCopies -TemplateUri https://raw.githubusercontent.com/rjmax/Build2017/master/Act1.TemplateEnhancements/Chapter03.SerialCopies.json

New-AzureRmResourceGroup -Name templateEnhancements -Location southcentralus -Force
New-AzureRmResourceGroup -Name crossResourceGroupDeployment -Location southcentralus -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName templateEnhancements -TemplateUri https://raw.githubusercontent.com/rjmax/Build2017/master/Act1.TemplateEnhancements/Chapter04.CrossResourceGroupDeployments.json

New-AzureRmResourceGroup -Name conditionalResourcesSsh -Location southcentralus -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName conditionalResourcesSsh -TemplateUri https://raw.githubusercontent.com/rjmax/Build2017/master/Act1.TemplateEnhancements/Chapter05.ConditionalResourcesUsernameOrSsh.json -passwordOrSshKey sshKey -adminSshKey "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFxBfkJx5H5QoNJ0aIU1+R7j/336stAtyGj9eh63v2SD+jmNtEfSw57fh/gj+QfYn6v0Q6drdOJcapGoR2S3Se7sgI6MhRlp7Olbee/fAY0ItF/scV8mO+hNvg1nQRkmwmG2sHT3JSXCgqUfTlhHB8t/ugD6EBHxiXG4UFuMxF4PHA/h4MTJz2rNqLjSBUSF1QbOHrp+O2nOwD3iidKfdTRz3EiTPrhQoB6cceLKnLE3B9i6V9dcWflYHgV04gxEwpEJykZxB3SbdnFtmv87gvvPlMoqb8fRSufdLzjp4ZVsKw92IdEl1W6l6URMQQyUSH+CkQ0+3ixI+2e/ZXNKsH imported-openssh-key" -dnsLabelPrefix "conditionssh"
New-AzureRmResourceGroup -Name conditionalResourcesPassword -Location southcentralus -Force
$SecurePassword = Read-Host -Prompt "Enter password" -AsSecureString 
New-AzureRmResourceGroupDeployment -ResourceGroupName conditionalResourcesPassword -TemplateUri https://raw.githubusercontent.com/rjmax/Build2017/master/Act1.TemplateEnhancements/Chapter05.ConditionalResourcesUsernameOrSsh.json -passwordOrSshKey password -dnsLabelPrefix "conditionpassword" -adminPassword $SecurePassword

