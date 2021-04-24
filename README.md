# ViExec is a PowerShell utility to retrive quick informations from any VCenter.

Simply type:

./viexec 'script-name' 'server-name' 'cluster-name'

The fields <server> and <cluster> can be autocompleted by pressing 'TAB'.
You can add or edit the available servers and clusters in the file named viexec.ps1.

ViExec uses nimmis/vcsim container in order to let you test the scripts locally before running them on your vCenters, Docker is required to start the testing environment.
To start the Docker container type:

./viexec docker-run

Running the docker-up script a vCenter will be automatically deployed with 3 clusters, 6 hosts, 10 Datastores and 35 VMs, you can adjust those values under the docker-up script.

To stop the testing environment type:

./viexec docker-stop

Last but not least, the uid of the Docker continaer is automatically saved under the 'temp' folder and will be used by the script 'docker-logs' to retirve quickly the logs from the Docker container.

In order to start using ViExec, you need to run the config file that will be available at the end of the help page, it will prompt you for your user and password that will be stored securely and re-used by the scripts.

A 'temp' folder will be automatically created under .\PowerTEST, and it will be used to store the uid of the Docker container and the credentials.

This is the list of available scripts:
datastores.ps1
docker-logs.ps1
docker-run.ps1
docker-stop.ps1
ipinfo.ps1
vminfo.ps1
vmsnic.ps1

If you need to export the results of the scripts add: > ./path/nameofthefile.txt/csv after the script, example:

./viexec vminfo server1 cluster1 > ./temp/vminfo.txt

If you wish, you can also use the full command with all his parameters, example:

./viexec -server 'server' -cluster 'cluster' -script 'script'
