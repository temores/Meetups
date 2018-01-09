Login-AzureRmAccount -SubscriptionName subname
Select-AzureRmSubscription -SubscriptionName subname

$role = Get-AzureRmRoleDefinition "contributor"
$role.Id = $null
$role.Name = "NSG" #friendly name of new role
$role.Description = "Allows user to modify anything but NSGs." #description
$role.Actions.Clear()
$role.Actions.Add("*/read")
$role.Actions.Add("*/write")
$role.NotActions.Add("Microsoft.Network/networkSecurityGroups/write")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add("/subscriptions/subid") #replace subid

New-AzureRmRoleDefinition -Role $role -Verbose 

 New-AzureRmRoleAssignment -SignInName user@domain.com -RoleDefinitionName "NSG" -ResourceGroupName RGNAME #replace RGname
 New-AzureRmRoleAssignment -SignInName user@domain.com -RoleDefinitionName "NSG" -Scope "/subscriptions/subid"
 New-AzureRmRoleAssignment -SignInName user@domain.com -RoleDefinitionName "NSG" -Scope "/subscriptions/subid/resourceGroups/RGNAME"

 $external = Get-AzurermADUser -SearchString "guest@domain.com"
 New-AzureRmRoleAssignment -ObjectId $external.Id -RoleDefinitionName "NSG" -Scope "/subscriptions/subid"

 #management


 remove-AzureRmRoleDefinition -Name "NSG"

 Get-AzureRmRoleAssignment 
 Get-AzureRmRoleAssignment -RoleDefinitionName "NSG" 
 Get-AzureRmRoleAssignment -ObjectId $external.Id

 Remove-AzureRmRoleAssignment -SignInName user@domain.com -ResourceGroupName RGNAME -RoleDefinitionName "NSG"
 Remove-AzureRmRoleAssignment -ObjectId $external.Id -Scope "/subscriptions/subid" -RoleDefinitionName "NSG"
  Remove-AzureRmRoleAssignment -ObjectId $external.Id -RoleDefinitionName "NSG" -Scope "/subscriptions/subid/resourceGroups/RGNAME/providers/Microsoft.Network/networkSecurityGroups/NSGNAME"