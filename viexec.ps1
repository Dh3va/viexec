#! /usr/bin/env pwsh

#Show "help" page as default script, it also contains the server and cluster values.
param(
    [string]$script = "help",
    [ValidateSet("localhost", "Server1", "Server2")]
    [string]$server,
    [ValidateSet("DC0_C0", "DC0_C1", "DC0_C2", "Customer1")]
    [string[]]$cluster,
    [switch]$help
)

#Utils.ps1 contains all the defined functions
.(".\src\utils.ps1")

if ($script -eq "help" -Or $help) {
    .(".\src\help.ps1")    
    exit 0
}

Ensure-Path-Exists

#Normalize user input removing the extension .ps1
$script = Normalize-Script-Name -Script $script

$AvailableScripts = Available-Scripts

Ensure-Script-Exists -Script $script -AvailableScripts $AvailableScripts

.(".\scripts\$script.ps1")






