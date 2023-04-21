# Custom Playbooks

Sentinel playbooks that have been created by me

The intention of this repository is to create an easy and fast way to deploy the Sentinel playbooks that I use for each tenant. The ARM templates that you see in this repostiory are the playbooks that I have created myself and can be deployed individually (script or button) or all at once.

## Prerequisites

- Clone repository
- edit the parameter files

<!-- <p align="right">(<a href="#top">back to top</a>)</p> -->

## Usage

Clone the repository if you want to use all of the scripts or need to make edits to the templates, but if you would just like to deploy one thing it may be easier just to download the script desired.

The deployment scripts for the Github playbooks do not have any special requirements. All you must do is download or copy the script into a new *.ps1* file, then run it from powershell.

Example usage:

```powershell
$targetScript = "link to raw file on github"
Invoke-WebRequest -Uri $targetScript -OutFile targetScript.ps1
.\targetScript.ps1 -ResourceGroup $yourResourceGroupName -Location $yourLocation
```

<p align="right">(<a href="#top">back to top</a>)</p>

## Post-deployment

All playbooks will have API connections that need to be updated. I plan to try to solve this problem in the future, but for now please perform the folowing tasks for *EACH PLAYBOOK* after a successful deploy:

- Go to the *Logic App Designer*
- Check each step for a API connection
- Update the connection with a new or existing API connection
- Save
- Go to the *API Connections* blade
- For each connection, go to *Edit connection*
- If applicable, click "Authorize connection", then enter your credentials
- Save

<p align="right">(<a href="#top">back to top</a>)</p>

### Quick Deploy

#### Enrich-EmailIncidents

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJakeD-5Q%2FCustomPlaybooks%2Fmain%2FEnrich-Emails-AutoCloseSpam%2Fazuredeploy.json)

#### Enrich-Incidents

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJakeD-5Q%2FCustomPlaybooks%2Fmain%2FEnrich-Incidents%2Fazuredeploy.json)

#### Initiate-MDEInvestigation

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJakeD-5Q%2FCustomPlaybooks%2Fmain%2FInitiate-MDEInvestigation%2Fazuredeploy.json)

#### Notify-NewIncident

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJakeD-5Q%2FCustomPlaybooks%2Fmain%2FNotify-NewIncident%2Fazuredeploy.json)

<p align="right">(<a href="#top">back to top</a>)</p>

## Disclaimer

Special thanks to the [Azure-Sentinel repository](https://github.com/Azure/Azure-Sentinel) for the inspiration and examples. There is part of this repository that I have reused (i.e. README content), I do not take credit for this.

Thank you to all of the contributors!

---

### To do

- [x] Add 'Deploy to Azure' buttons
- [ ] Write README for all
- [ ] Add parameter descriptions
- [ ] finish Autorespond 
- [ ] finish notify-overnight
- [ ] ***automate the creation of the common API connections***