param(
    [Parameter(Mandatory = $true)]$ResourceGroup
)


$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"


$Name = "Initiate-MDEInvestigation"
$deploymentName = $Name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/JakeD-5Q/CustomPlaybooks/main/Initiate-MDEInvestigation/azuredeploy.json"
$localTemplate = 'enter.local.file.json'
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose