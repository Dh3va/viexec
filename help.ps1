.("./utils.ps1")

Write-Host "
#
# ViExec - Help   
# Author: Alessandro Pranzo
# Date: 21/03/2021
# Version: 1.0
#`n"

Write-Host "ViExec is a PowerShell utility to retrive quick informations from any VCenter. In order to run any script, first you need to specify the Server (the VCenter you wan't to connecto to) the Cluster and the script you want to run:`n"

Write-Host "Example:`n./viexec -server <server> -cluster <cluster> -script <script>`n The script can autocomplete the -server and -cluster results by pressing TAB`n"

Write-Host "A .\temp folder will be automatically created under .\PowerTEST, that path will be the default path for the script results.`n
In order to use the ViExec, you also need to pass trough the config file.`n"

Script-List

Ensure-Config-Exists