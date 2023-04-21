param(
    [Parameter(Mandatory = $true)]$ResourceGroup
)

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"


$name = "Reset-AADUserPassword"
$deploymentName = $name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose


$name = "Revoke-AADSignInSessions"
$deploymentName = $name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose


$name = "Block-AADUserOrAdmin"
$deploymentName = $name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose


$Name = "Confirm-AADRiskyUser"
$deploymentName = $name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose


$Name = "Dismiss-AADRiskyUser"
$deploymentName = $name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose