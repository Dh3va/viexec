Ensure-Server-Set

Ensure-Cluster-Set

#Connection
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | 
Get-VM | 
Select Name, PowerState, Guest, NumCpu, MemoryMB, MemoryGB