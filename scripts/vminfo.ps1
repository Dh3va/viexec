.("./config.ps1")

Connect-VIServer $server -User $username -Password $password

Get-Cluster $cluster | Get-VM | Select Name,PowerState,Version,Guest,NumCpu,MemoryMB,MemoryGB | Sort Name | Export-CSV $user_path".csv"

Write-Host "test"