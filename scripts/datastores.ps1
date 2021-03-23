.("./config.ps1")

#Connection
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | 

Get-Datastore | 

Select Name,

@{
    
    N=’CanonicalName’;
    
    E={$_.Extensiondata.Info.Vmfs.Extent[0].DiskName}

} |

Sort Name | 

Export-CSV $path\vminfo.csv