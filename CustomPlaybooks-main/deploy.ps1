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
        -Location $Location 
        # -Verbose
}


## The following four lines only need to be declared once in your script.
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Description."
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Description."
$cancel = New-Object System.Management.Automation.Host.ChoiceDescription "&Cancel", "Description."
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no, $cancel)


## Use the following each time your want to prompt the use
$title = "Parameter check" 
$message = "Have you updated all of the parameter files with your information?"
$result = $host.ui.PromptForChoice($title, $message, $options, 1)
switch ($result) {
    0 {
        Write-Host "Preparing deploy..." -ForegroundColor Green
        Write-Host "Hope you ready because here we go!!"
        Start-Sleep -Seconds 5
        & Automate-EmailInvestigations/deploy.ps1 $ResourceGroup
        & Enrich-EmailIncidents/deploy.ps1 $ResourceGroup
        & Enrich-Incidents/deploy.ps1 $ResourceGroup
        & Initiate-MDEInvestigation/deploy.ps1 $ResourceGroup
        & Notify-NewIncident/deploy.ps1 $ResourceGroup
    }1 {
        Write-Host "Please update the parameter files then rerun" -ForegroundColor Red;
        Exit;
    }2 {
        Write-Host "Cancel" -ForegroundColor Red;
        Print-ConfigurableValues;
        Exit;
    }
}



