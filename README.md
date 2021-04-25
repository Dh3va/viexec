# ViExec

ViExec is a PowerShell utility to retrieve quick information from any VCenter, simply type:

```bash
./viexec 'script-name' 'server-name' 'cluster-name'
```

## Installation and setup

Using the Docker-run/stop/logs scripts requires [Docker](https://www.docker.com/) to be installed on your machine. 

To start using ViExec simply do a clone of the repository:

```bash
gh repo clone Dh3va/viexec
```
Then run the configuration using the help option:

```bash
./viexec.ps1 -help
```

## Usage

ViExec can can be used to automize and test your PowerCLI scipts.

```bash
datastores localhost DC0_C0

Name                           Port  User
----                           ----  ----
localhost                      443   Alessandro

Name          : LocalDS_0
CanonicalName :


Name          : LocalDS_1
CanonicalName :


Name          : LocalDS_2
CanonicalName :
```

It accepts two fields, 'server' and 'cluster' and they both can be autocompleted by pressing 'TAB'.
You can add or edit the available servers and clusters in viexec.ps1.

```bash
    [ValidateSet("localhost", "Server1", "Server2")]
    [string]$server,
    [ValidateSet("DC0_C0", "Cluster2", "Cluster3")]
```

ViExec uses [nimmis/vcsim](https://github.com/nimmis/docker-vcsim) container in order to let you test the scripts locally before running them on your vCenters, Docker is required to start the testing environment.
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
