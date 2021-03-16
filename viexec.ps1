#! /usr/bin/env pwsh

#This will print the "help" page as soon as the viexec script is launched. By default server and cluster are empty.
param(
    [string]$script = "help",
    [ValidateSet("vcenter.vmware.ntt.eu", "vcenter-rim.sys.ntt.eu", "vcenter2-rim-hemel.infra.ntt.eu")]
    [string]$server,
    [ValidateSet("PROD-CUBE", "Prod-Cube-2", "PROD-OSMOSE", "DRP-PP", "PP-CUBE", "Kubota_Prod")]
    [string]$cluster
)
#Utils.ps1 contains all the defined functions
.("./utils.ps1")

Ensure-Server-Set

Ensure-Cluster-Set

#Filters all the scripts inside ./scripts that contains .ps1
$available_scripts = Get-ChildItem "./scripts" -Name -Filter *.ps1 

#Normalize user input removing the extension .ps1
#$script = Normalize-Script-Name($script)

if(
    $script -match '.ps1'
) 
{
    $script = $script -replace '\.ps1$', ""
}

#Checks if the script exists
$script_exists = $available_scripts.Contains("$script.ps1")  

if(
    -not($script_exists)
)
{
    Write-Host "The script $script doesn't exist. This is a list of existing scripts:`n "

Script-List

    foreach ($scriptfile in $scriptfiles) {
        Write-Host "$scriptfile"
    }
    
    exit 1
}

.("./scripts/$script.ps1")



