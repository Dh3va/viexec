Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

$datacenter = Get-Datacenter

Get-Datacenter $datacenter | Get-VMHost | Select-Object @{N="Name";E={$_.Name}},@{N="Management Network";E={(Get-VMHostNetworkAdapter -VMHost $_.Name  | Where-Object {$_.Name -eq "vmk0"}).IP }}