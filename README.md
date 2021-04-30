# ViExec

ViExec is a PowerShell utility to retrieve quick information from any VCenter, simply type:

```bash
./viexec 'script-name' 'server-name' 'cluster-name'
```

## Installation and setup

PowerShell and PowerCLI are required to use ViExec:

- [Install PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.1)

Once PowerShell is installed:

```Bash
pwsh

Find-Module -Name VMware.PowerCLI

Install-Module -Name VMware.PowerCLI -Scope CurrentUser
```

Using the Docker-start/stop/logs scripts requires [Docker](https://www.docker.com/) to be installed on your machine. 

To start using ViExec simply do a clone of the repository:

```bash
gh repo clone Dh3va/viexec

git clone https://github.com/Dh3va/viexec.git
```
Then run the configuration script typing:

```bash
./viexec.ps1 -help
```

The config script will prompt you for your user and password that will be stored securely and re-used by the scripts.

If you are using ViExec from MacOs or Linux, install PowerShell on your System.

## Usage

ViExec can be used to automize and test your PowerCLI scripts:

```bash
./viexec.ps1 vminfo localhost DC0_C0

Name                           Port  User
----                           ----  ----
localhost                      443   a

Name               : DC0_C0_RP0_VM5
PowerState         : PoweredOn
GuestId            : otherGuest
NumCpu             : 1
MemoryGB           : 0.03125
DatastoreIdList    : {Datastore-/tmp/govcsim-DC0-LocalDS_0-283607359@folder-5}
VMHost             : DC0_C0_H0
ResourcePool       : Resources
DrsAutomationLevel : AsSpecifiedByCluster
PersistentId       : 9808c19f-53e2-5f57-ada0-f2dedcc70ae5
Id                 : VirtualMachine-vm-470
UsedSpaceGB        : 0
```

It accepts two fields, 'server' and 'cluster', they both can be autocompleted by pressing 'TAB' and the 'Cluster' option now accepts multiple values, allowing you to execute a script on multiple clusters at the same time:

```bash_
./viexec vminfo localhost DC0_C0,DC0_C1,DC0_C2
```

You can add, remove or edit the available servers and clusters in viexec.ps1:

```bash
    [ValidateSet("localhost", "Server1", "Server2")]
    [string]$server,
    [ValidateSet("DC0_C0", "Cluster2", "Cluster3")]
    [string]$cluster
```

## Testing environment

ViExec uses [nimmis/vcsim](https://github.com/nimmis/docker-vcsim) to let you test the scripts locally before running them on your vCenters, [Docker](https://www.docker.com/) is required to start the testing environment.

To start the Docker container type:

```bash
./viexec docker-start
```

Running the docker-start script, a vCenter will be automatically deployed with 3 clusters, 6 hosts, 10 Datastores and 35 VMs:

```bash
$dockeruid = & "docker" "run" "--detach" "--publish" "443:443" "nimmis/vcsim" "-c" "3" "--data-stores" "10" "--hosts" "6" "--virtual-machines" "35"
```

To stop the testing environment type:

```bash
./viexec docker-stop
(Under development)
```

Last but not least, the uid of the Docker container is automatically saved under the './temp' folder and will be used by the script 'docker-logs' to retrieve quickly the logs from the Docker container.

The './temp' folder will be automatically created under './PowerTEST', and it will be used to store the uid of the Docker container and the user credentials.

## Exporting the results of your scripts

If you need to export the results of the scripts add: > ./path/nameofthefile.txt/csv after the script, example:

```bash
./viexec vminfo server1 cluster1 > ./temp/vminfo.txt
```

If you wish, you can also use the full command with all his parameters, for example:

./viexec -server 'server' -cluster 'cluster' -script 'script'

## Add these functions to your scripts to test and use them with ViExec

Place your 'scripts.ps1' inside the './scripts' folder and add the following Functions and lines to integrate them with ViExec:

```bash
Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

#PowerCLI script goes after the '|'.
Get-Cluster $cluster | 
```

If your script doesn't need a specific Cluster remove Ensure-Cluster-Set and the Get-Cluster from the script.
