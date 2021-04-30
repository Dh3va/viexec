Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | Get-VM | Get-Snapshot | Select-Object -Property VM, Name, @{Label = "Size"; Expression = { "{0:N2} GB" -f ($_.SizeGB) } } | ft -AutoSize