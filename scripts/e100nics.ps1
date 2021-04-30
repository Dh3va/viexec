Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | Get-VM | Where { Get-NetworkAdapter -VM $_ | where { $_.Type -eq 'e1000' } } | Select Name