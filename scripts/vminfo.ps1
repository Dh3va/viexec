.("./config.ps1")

#Connection
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | 

Get-VM | 

Select Name, PowerState, Version, Guest, NumCpu, MemoryMB, MemoryGB | 

Sort Name | 

Export-CSV $path\vminfo.csv