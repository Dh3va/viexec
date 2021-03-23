.("./config.ps1")

Get-Credentials-Connect

Get-Cluster $cluster | 

Get-VM | 

Select Name, PowerState, Version, Guest, NumCpu, MemoryMB, MemoryGB | 

Sort Name | 

Export-CSV $path".csv"