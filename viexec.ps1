#! /usr/local/bin/pwsh

#Show "help" page as default script, it also contains the server and cluster values.
param(
    [string]$script = "help",
    [ValidateSet("localhost", "vcenter.vmware.ntt.eu", "vcenter-rim.sys.ntt.eu", "vcenter2-rim-hemel.infra.ntt.eu")]
    [string]$server,
    [ValidateSet("PROD-CUBE", "Prod-Cube-2", "PROD-OSMOSE", "DRP-PP", "PP-CUBE", "Kubota_Prod")]
    [string]$cluster,
    [switch]$help
)

#Utils.ps1 contains all the defined functions
.("./utils.ps1")

if ($script -eq "help" -Or $help) {
    .("./help.ps1")    
    exit 0
}

# Ensure-Path-Exists

# Ensure-Server-Set

# Ensure-Cluster-Set

#Filters all the scripts inside ./scripts that contains .ps1
$AvailableScripts = Get-ChildItem "scripts" -Name -Filter *.ps1 

#Normalize user input removing the extension .ps1
$script = Normalize-Script-Name -Script $script

Ensure-Script-Exists -Script $script -AvailableScripts $AvailableScripts

.("./scripts/$script.ps1")



