param(
    [Parameter(Mandatory = $true)]$ResourceGroup,
    [Parameter(Mandatory = $true)]$Prefix
)

# Concatenate the customer-supplied prefix and the playbook name
function New-PbName() {
    param(
        [Parameter(Mandatory = $true)]$Prefix,
        [Parameter(Mandatory = $true)]$PlaybookName
    )

    $NewName = $Prefix + "." + $PlaybookName
    return $NewName
}

# Connect to your Azure Active Directory
Connect-AzureAD

$Name = "Isolate-MDEMachine"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID

$Name = "Unisolate-MDEMachine"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID

$Name = "Remove-MDEAppExecution"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID

