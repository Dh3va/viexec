#Utils.ps1 contains all the defined functions
.("./utils.ps1")

Ensure-Path-Exists

$Credentials = Get-Credential

$Credentials | Export-Clixml -Force -Path $UserPath\ucred-secure.cred

