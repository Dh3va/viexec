#Connection
Get-Credentials-Connect

Ensure-Server-Set

Ensure-Cluster-Set

#PowerCLI script
Get-Cluster $cluster | 
Get-VM | 
Select Name, PowerState, Guest, NumCpu, MemoryMB, MemoryGB