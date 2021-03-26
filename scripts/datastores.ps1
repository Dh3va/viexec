#Connection
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | 

Get-Datastore | 

Select Name,

@{
    
    N = ’CanonicalName’;
    
    E = { $_.Extensiondata.Info.Vmfs.Extent[0].DiskName }

}