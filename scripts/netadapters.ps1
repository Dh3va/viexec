Ensure-Server-Set

Ensure-Cluster-Set

#Connects to the vCenter using the securely stored credentials
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | 

Get-NetworkAdapter -VM evl2400725, evl2400794, evl2400795 | Select Parent, Name, MacAddress, NetworkName | Export-CSV F:\Alessandro\migration3.csv