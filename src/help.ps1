Write-Host "
#
# ViExec - Help   
# Author: Alessandro Pranzo
# Date: 24/04/2021
# Version: 1.1
#`n"

Write-Host "ViExec is a PowerShell utility to retrive quick informations from any VCenter, simply type:`n"

Write-Host "./viexec <script-name> <server-name> <cluster-name>`n"

Write-Host "The fileds <server> and <cluster> can be autocompleted by pressing 'TAB'.`nYou can add or edit the available servers and clusters in the file named viexec.ps1.`n"

Write-Host "ViExec uses nimmis/vcsim container in order to let you test the scripts locally before running them on your vCenters, Docker is required to start the testing environment.`nTo start the Docker container type:`n"

Write-Host "./viexec docker-run`n"

Write-Host "Running the docker-up script a vCenter will be automatically deployed with 3 clusters, 6 hosts, 10 Datastores and 35 VMs, you can adjust those values under the docker-up script.`n"

Write-Host "To stop the testing environment type:`n"

Write-Host "./viexec docker-stop`n"

Write-Host "Last but not least, the uid of the Docker continaer is automatically saved under the 'temp' folder and will be used by the script 'docker-logs' to retirve quickly the logs from the Docker container.`n"

Write-Host "In order to start using ViExec, you need to run the config file that will be available at the end of the help page, it will prompt you for your user and password that will be stored securely and re-used by the scripts.`n"

Write-Host "A 'temp' folder will be automatically created under .\PowerTEST, and it will be used to store the uid of the Docker container and the credentials.`n"

$AvailableScripts = Available-Scripts

Script-List -Scripts $AvailableScripts

Write-Host "If you need to export the results of the scripts add: > ./path/nameofthefile.txt/csv after the script, example:`n"

Write-Host "./viexec vminfo server1 cluster1 > ./temp/vminfo.txt`n"

Write-Host "If you wish, you can also use the full command with all his parameters, example:`n"

Write-Host "./viexec -server <server> -cluster <cluster> -script <script>`n"

Ensure-Config-Exists
