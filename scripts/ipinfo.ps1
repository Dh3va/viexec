.("./config.ps1")

Connect-VIServer $server -User $username -Password $password

Get-Cluster $cluster Get-VM |

Select Name,VMHost, @{N="IP Address";E={@($_.guest.IPAddress -join '|')}} |

Export-Csv -NoTypeInformation C:\Users\gemela\Desktop\machine_ip.csv

$report = foreach($vm in Get-VM){

    foreach($ip in $vm.Guest.IPAddress){

        $obj = [ordered]@{

            Name = $vm.Name

            Host = $vm.VMHost.Name

            IP = $ip

        }

        New-Object PSObject -Property $obj

    }

}

$report | Sort-Object -Property {($_ | Get-Member -MemberType Properties).Count} -Descending |

Export-Csv $user_path".csv" -NoTypeInformation -UseCulture