Ensure-Server-Set

Ensure-Cluster-Set

#Connection
Get-Credentials-Connect

#Gets hosts properties and exports them into ./temp/hosts.txt
Get-Datacenter | Get-VMHost | Format-Custom > ./temp/hosts.txt