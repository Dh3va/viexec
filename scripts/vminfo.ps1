Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | 
Get-VM | 
Select Name, PowerState, GuestId, NumCpu, MemoryGB, DatastoreIdList, VMHost, ResourcePool, DrsAutomationLevel, PersistentId, Id, UsedSpaceGB