.("./utils.ps1")

Write-Host "`n
################################################################################
#                                ViExec - Help                                 #
################################################################################`n"

Write-Host "ViExec is a PowerShell utility to retrive quick informations from any VCenter. In order to run any script, first you need to specify the Server (the VCenter you wan't to connecto to) the Cluster and the script you want to run:`n"

Write-Host "Example:`n./viexec -server <server> -cluster <cluster> -script <script>`n The script can autocomplete the -server and -cluster results by pressing TAB"

Write-Host "In order to use the script you need to edit the file config.ps1"

Script-List