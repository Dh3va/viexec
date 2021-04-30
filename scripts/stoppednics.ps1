Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | Get-VM | % { $strVMName = $_.Name; Get-NetworkAdapter -VM $_ | ` select @{n = "VMName"; e = { $strVMName } }, Name, NetworkName, ConnectionState } | ? { $_.ConnectionState.StartConnected -eq $false }