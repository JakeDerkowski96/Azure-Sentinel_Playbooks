# Enrich Email Plus

This playbook targets all of the email-related incidents that are generated from the *Create incidents from Defender for Office 365* analytical rule and aims to eliminate the need to navigate to other sources outside of Microsoft Sentinel for the required evidence to accurately close the given incident. This is achieved by updating the incident with comments and tags of useful information regarding the triggering event(s).

## Deploy to Azure

This playbook uses an incident trigger, so after a successful deploy you must attach this playbook to an automation rule for it to run automatically.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJakeD-5Q%2FDeployPlaybooks%2Fmain%2FEnrich-Comment-EmailDetails%2Fazuredeploy.json)

## Post-Deployment




