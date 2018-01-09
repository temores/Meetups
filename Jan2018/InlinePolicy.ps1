$ResourceGroup = Get-AzureRmResourceGroup -Name "ExampleGroup"

$definition = New-AzureRmPolicyDefinition -Name testDefinition -DisplayName "Test policy" -Policy "{""if"":{""source"":""action"",""equals"":""Microsoft.Compute/virtualMachines/write""},""then"":{""effect"":""deny""}}"

New-AzureRmPolicyAssignment -Name testDefinition -Scope $ResourceGroup.ResourceId -PolicyDefinition $definition

#Delete Asignment

Remove-AzureRmPolicyAssignment -Name testDefinition -Scope $ResourceGroup.ResourceId

#Delete Definition

Remove-AzureRmPolicyDefinition -Name testdefinition -Force

