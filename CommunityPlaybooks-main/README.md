# CommunityPlaybooks
Expedite deployment of the community Sentinel playbooks

## About

This is a directory of Powershell scripts that call upon the Microsoft Sentinel Github repository to deploy their playbook ARM templates. Many of these playbooks require Azure Active Directory (AAD) permissions for them to function, there will be an additional script present for these. Then again there are some other requirements that cannot currently be satisfied by script. These will be noted in the README.md plus there will be a warning message in the groups deploy script.

## Usage

1. Clone this repository (using Azure Cloud shell is recommended)
            
        git clone https://github.com/JakeD-5Q/CommunityPlaybooks.git

2. Decide which group to deploy
3. Navigate to this folder
4. First run the "deploy.ps1" script (Take note of any errors)
5. If a "Grant-Permissions.ps1" exists, run this one too.

---

**Coming soon**

Script will output the following info to a file:
- All output
- Failed deploys
- Successful deploys
- Details about additional configuration steps (if applicable)



### Deploy

Follow the steps above to automate the deployment of groups of playbooks or deploy from the buttons below.