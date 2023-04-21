param(
    [Parameter(Mandatory = $true)]$ResourceGroup
)

# Connect to your Azure Active Directory
Connect-AzureAD

# check is RG exists, create one with the provided name if False
Get-AzResourceGroup -Name $ResourceGroup -ErrorVariable notPresent -ErrorAction SilentlyContinue

if ($notPresent) {
    Write-Host "This resource group does not exist. To create new resource group"
    
    $Location = Read-Host "Enter the location:"
    
    New-AzResourceGroup -Name $ResourceGroup `
        -Location $Location `
        # -Verbose
}

# Create unique deployment name
$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

# Prepare the deploy command's variables
$Name = "Restrict-MDEUrl"
$deploymentName = $Name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$Name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose


$Name = "Restrict-MDEAppExecution"
$deploymentName = $Name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$Name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose	


$Name = "Restrict-MDEDomain"
$deploymentName = $Name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$Name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose	


$Name = "Restrict-MDEFileHash"	
$deploymentName = $Name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$Name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose	


$Name = "Restrict-MDEIPAddress"	
$deploymentName = $Name + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/$Name/alert-trigger/azuredeploy.json"
$localTemplate = "Parameters/$Name.json"
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $localTemplate `
    -Verbose	
