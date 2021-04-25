Ensure-Server-Set

Ensure-Cluster-Set

#Connection
Get-Credentials-Connect

Get-Cluster $cluster | 
Get-VM |
Select Name, VMHost, 
@{N = "IP Address"; E = { @($_.guest.IPAddress -join '|') } } | 
Export-Csv -NoTypeInformation ./temp/machine_ip.csv
$report = foreach ($vm in Get-VM) {
    foreach ($ip in $vm.Guest.IPAddress) {
        $obj = [ordered]@{Name = $vm.Name
            Host               = $vm.VMHost.Name
            IP                 = $ip
        }
        New-Object PSObject -Property $obj
    }
}
$report | 
Sort-Object -Property { 
    ($_ | Get-Member -MemberType Properties).Count } -Descending