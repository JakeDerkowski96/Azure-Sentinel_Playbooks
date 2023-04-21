#### Secure Score summary

- Create AAD app registration
- Grant it API permissions for Microsoft Graph:
  - [ ] SecurityEvents.Read.All
  - [ ] SecurityEvents.ReadWrite.All
- Grant permissions for WindowsDefenderATP (APIs my organization use)
  - [ ] Score.Read.All
  - [ ] SecurityRecommendation.Read.All
  - [ ] Vulnerability.Read.All
- Crate an app secret, record it immediately
- record the object Id and tenant Id
- Grab workspace Id and the primary key from the Log Analytics workspace blade

Then deploy

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FM365-Security-Posture%2Fazuredeploy.json)

Detailed directions can be found at the link above.
