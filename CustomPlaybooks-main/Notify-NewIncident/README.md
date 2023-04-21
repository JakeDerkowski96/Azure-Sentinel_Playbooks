# Notify-NewIncident

This playbooks is an adaptation to the [Send-email-with-formatted-incident-report](https://github.com/Azure/Azure-Sentinel/tree/master/Playbooks/Send-email-with-formatted-incident-report). I have added a step that sends the formatted report to the organization's SOC SharePoint site--essentially creating a database of all the incident reports. The purpose of this is to make it easier for a separate playbook to fetch a particular report when escalation is necessary.

## Prerequisites

None.

## Quick Deployment **Deploy with incident trigger** (recommended)

After deployment, attach this playbook to an automation rule so it runs when the incident is created.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJakeD-5Q%2FCustomPlaybooks%2Fmain%2FNotify-NewIncident%2Fazuredeploy.json)


## Screenshots
[provide screenshot]()


