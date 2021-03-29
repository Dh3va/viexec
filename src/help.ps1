Write-Host "
#
# ViExec - Help   
# Author: Alessandro Pranzo
# Date: 21/03/2021
# Version: 1.0
#`n"

Write-Host "ViExec is a PowerShell utility to retrive quick informations from any VCenter. In order to run any script, first you need to specify the Server (the VCenter you want to connect to) the Cluster and the script you want to run:`n"

Write-Host "Example:`n./viexec -server <server> -cluster <cluster> -script <script>`nThe fileds <server> and <cluster> can be autocompleted by pressing TAB. You can add or edite the available servers and cluster in the file named viexec.ps1.`n"

Write-Host "A .\temp folder will be automatically created under .\PowerTEST, and it will be the default path for the scripts results.`n
In order to use the ViExec, you also need to pass trough the config file.`n"

$AvailableScripts = Available-Scripts

Script-List -Scripts $AvailableScripts

Write-Host "If you need to export the results of the commands simply add > ./path/nameofthefile.txt/csv after the script:`n"

Write-Host "Example:`n ./viexec -server <server> -cluster <cluster> -script <script> > nameofthefile.csv`n"

Ensure-Config-Exists
