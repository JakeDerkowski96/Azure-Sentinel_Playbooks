param(
    [Parameter(Mandatory = $true)]$MIGuid,
    [Parameter(Mandatory = $true)]$SubscriptionId,
    [Parameter(Mandatory = $true)]$ResourceGroup
)

$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

$roleName = "Security Admin"

$role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq $roleName }

if ($null -eq $role) {
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object { $_.displayName -eq $roleName }
    
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId
    $role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq $roleName }
}

Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $MI.ObjectID

New-AzRoleAssignment -ObjectId $MIGuid `
    -RoleDefinitionName $roleName `
    -Scope /subscriptions/$SubscriptionId/resourcegroups/$ResourceGroup