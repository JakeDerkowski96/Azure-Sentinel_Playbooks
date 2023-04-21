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


$Name = "Restrict-MDEAppExecution"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID


$Name = "Restrict-MDEUrl"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID


$Name = "Restrict-MDEDomain"
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID


$Name = "Restrict-MDEFileHash"	
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID


$Name = "Restrict-MDEIPAddress"	
$NewName = New-PbName $Prefix $Name
$ID = (Get-AzResource -Name $NewName -ResourceType Microsoft.Logic/workflows).Identity.PrincipalId
& .\Permissions\$Name.ps1 -MIGuid $ID -SubscriptionId $SubscriptionId -ResourceGroup $ResourceGroup



