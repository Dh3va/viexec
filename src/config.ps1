#Utils.ps1 contains all the defined functions
.("./src/utils.ps1")

Ensure-Path-Exists

$Credential = Get-Credential

$Credential | Export-Clixml -Force -Path .\temp\ucred-secure.cred

