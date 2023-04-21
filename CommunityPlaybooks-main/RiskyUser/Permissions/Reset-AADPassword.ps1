param(
    [Parameter(Mandatory = $true)]$MIGuid,
    [Parameter(Mandatory = $true)]$SubscriptionId,
    [Parameter(Mandatory = $true)]$ResourceGroup
)

$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

$GraphAppId = "00000003-0000-0000-c000-000000000000"
$roleName = "Password Administrator"
$SentinelRoleName = "Microsoft Sentinel Responder"

$GraphServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$GraphAppId'"

$role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq $roleName }

if ($null -eq $role) {
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object { $_.displayName -eq $roleName }
    
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId
    $role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq $roleName }
}

Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $MI.ObjectID

New-AzRoleAssignment -ObjectId $MIGuid -RoleDefinitionName $SentinelRoleName -Scope /subscriptions/$SubscriptionId/resourcegroups/$ResourceGroup
