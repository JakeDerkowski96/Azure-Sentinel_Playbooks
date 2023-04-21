param(
    [Parameter(Mandatory = $true)]$ResourceGroup,
    [Parameter(Mandatory = $true)]$Prefix
)

Connect-AzureAD

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

# Retrieve the Subscription ID for permission scripts
$SubscriptionId = (Get-AzContext).Subscription.id

$Name = "Revoke-AADSignInSessions"	
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID


$Name = "Reset-AADUserPassword"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID -SubscriptionId $SubscriptionId -ResourceGroup $ResourceGroup


$Name = "Block-AADUserOrAdmin"	
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID -SubscriptionId $SubscriptionId -ResourceGroup $ResourceGroup


$Name = "Confirm-AADRiskyUser"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID -SubscriptionId $SubscriptionId -ResourceGroup $ResourceGroup


$Name = "Dismiss-AADRiskyUser"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID -SubscriptionId $SubscriptionId -ResourceGroup $ResourceGroup
