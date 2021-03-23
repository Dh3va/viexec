.("./config.ps1")

#Connection
Get-Credentials-Connect

#PowerCLI script
Get-Cluster $cluster | 

Get-VM | 

Get-NetworkAdapter | 

Select-Object @{
    
    N = ”VM”; 

    E = { $_.Parent.Name } 

}, 

@{
    N = ”NIC”; 

    E = { $_.Name } 
}, 

@{
    N = ”Network”; 
    
    E = { $_.NetworkName } 
} | 
    
ft -AutoSize | 
    
Sort Name | 
    
Export-CSV $path\vmsnic.csv