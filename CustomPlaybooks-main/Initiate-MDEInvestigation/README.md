# Initiate-MDEInvestigation

This playbooks combines the Run-[MDEAntivirus](https://github.com/Azure/Azure-Sentinel/tree/master/Playbooks/Run-MDEAntivirus), [Start-MDEAutomatedInvestigation](https://github.com/Azure/Azure-Sentinel/tree/master/Playbooks/Start-MDEAutomatedInvestigation), and [Get-MDEInvestigationPackage](https://github.com/Azure/Azure-Sentinel/tree/master/Playbooks/Get-MDEInvestigationPackage) into one, easy-to-use, Alert-trigger playbook.


## Quick Deployment

After deployment, you can run this playbook manually on an alert or attach it to an analytics rule so it will run when an alert is created.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJakeD-5Q%2FCustomPlaybooks%2Fmain%2FInitiate-MDEInvestigation%2Fazuredeploy.json)

## Prerequisites

### Parameters

Configure parameters to get notification in desired Microsoft Teams channel/group about the investigations that were started, their status, and links to view the results. If done correctly, this is very useful to keep track of all investigations and provides quick and easy access.

1. Teams Group ID
2. Teams Channel ID

[This blog](https://www.linkedin.com/pulse/3-ways-locate-microsoft-team-id-christopher-barber-/) shows some simple methods to get the Team Id. You will need the Team Id and Channel Id.

You will need to assign this playbook with the following AAD permissions:

- Machine.CollectForensics
- Machine.Scan
- Machine.Read.All
- Machine.ReadWrite.All
- Alert.ReadWrite.All
  script below

```powershell
# the AzureAD required permissions to perform MDE AV scans, collect forensic pkgs, start automated investigations

param(
    [Parameter(Mandatory = $true)]$PlaybookName
)

Connect-AzureAD

# get the object id of the playbook
$MIGuid = (Get-AzResource -Name $PlaybookName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId

$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

# Collect Forensic package~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$MDEAppId = "fc780465-2017-40d4-a0c5-307022471b92"
$PermissionName = "Machine.CollectForensics" 

$MDEServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$MDEAppId'"
$AppRole = $MDEServicePrincipal.AppRoles | Where-Object { $_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application" }
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
    -ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id

# Run Anti-Virus Scan~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$PermissionName = "Machine.Scan" 

$MDEServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$MDEAppId'"
$AppRole = $MDEServicePrincipal.AppRoles | Where-Object { $_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application" }
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
    -ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id

$PermissionName = "Machine.Read.All"
$AppRole = $MDEServicePrincipal.AppRoles | Where-Object { $_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application" }
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
    -ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id

$PermissionName = "Machine.ReadWrite.All"
$AppRole = $MDEServicePrincipal.AppRoles | Where-Object { $_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application" }
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
    -ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id

# Automated Investigation~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$PermissionName = "Alert.ReadWrite.All" 

$MDEServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$MDEAppId'"
$AppRole = $MDEServicePrincipal.AppRoles | Where-Object { $_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application" }
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
    -ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id
```

## Screenshots

[provide screenshot]()
