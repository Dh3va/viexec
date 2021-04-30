Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | Get-VM | Get-CDDrive | select @{N = "VM"; E = "Parent" }, IsoPath | where { $_.IsoPath -ne $null }