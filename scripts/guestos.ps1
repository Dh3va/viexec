Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

$filter = @{"Runtime.PowerState" ="poweredOn"; "Config.GuestFullName" = "Linux"}

Get-View -ViewType "VirtualMachine" -Filter $filter | foreach{$_.ShutdownGuest()}