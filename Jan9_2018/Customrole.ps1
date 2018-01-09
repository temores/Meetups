Login-AzureRmAccount -SubscriptionName adrianprimary
Select-AzureRmSubscription -SubscriptionName adrianprimary
$role = Get-AzureRmRoleDefinition "contributor"
$role.Id = $null
$role.Name = "NSG" #friendly name of new role
$role.Description = "Allows user to modify anything but NSGs." #description
$role.Actions.Clear()
$role.Actions.Add("*/read")
$role.Actions.Add("*/write")
$role.NotActions.Add("Microsoft.Network/networkSecurityGroups/write")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add("/subscriptions/a9ab2198-f5a6-4e71-a979-6043272806a3") #replace subid

Remove-AzureRmRoleDefinition -Name "NSG" -Role $role -Verbose 

 New-AzureRmRoleAssignment -SignInName pabyrd@microsoft.com -RoleDefinitionName "NSG" -ResourceGroupName adrianlb #replace RGname
 New-AzureRmRoleAssignment -SignInName pabyrd@microsoft.com -RoleDefinitionName "NSG" -Scope "/subscriptions/a9ab2198-f5a6-4e71-a979-6043272806a3"
 New-AzureRmRoleAssignment -SignInName pabyrd@microsoft.com -RoleDefinitionName "NSG" -Scope "/subscriptions/a9ab2198-f5a6-4e71-a979-6043272806a3/resourceGroups/adrianlb"

 $external = Get-AzurermADUser -SearchString "temores@outlook.com"
 New-AzureRmRoleAssignment -ObjectId $external.Id -RoleDefinitionName "NSG" -Scope "/subscriptions/a9ab2198-f5a6-4e71-a979-6043272806a3"

 #management


 remove-AzureRmRoleDefinition -Name "NSG"

 Get-AzureRmRoleAssignment 
 Get-AzureRmRoleAssignment -RoleDefinitionName "NSG" 
 Get-AzureRmRoleAssignment -ObjectId $external.Id

 Remove-AzureRmRoleAssignment -SignInName pabyrd@microsoft.com -ResourceGroupName adrianlb -RoleDefinitionName "NSG"
 Remove-AzureRmRoleAssignment -ObjectId $external.Id -Scope "/subscriptions/a9ab2198-f5a6-4e71-a979-6043272806a3" -RoleDefinitionName "NSG"