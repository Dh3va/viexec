function Ensure-Server-Set {
    if (
        -not($server)
    ) {
        Write-Warning "-server is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
        exit 1

        $available_servers = Get-Content -Path .\ServerList\serverlist.txt

        Write-Host "$available_servers"

    }
}
function Ensure-Cluster-Set {
    if (
        -not($cluster)
    ) {
        Write-Warning "-cluster is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
        exit 1
    }
}

function Get-Credentials-Connect {
    param(
        [string]$Credentials
    )
   
    $User = Read-Host -Prompt "Enter username NTTENG\username"

    $SecurePassword = Read-Host -Prompt "Enter password" -AsSecureString

    Connect-VIServer $server -User $User -Password $SecurePassword

}

# function Ensure-Config-Exists {

#     If ((Test "config.ps1") -eq $Null) {

#         $confirmation = Read-Host "Would you like to run the configuration file now?"

#         if ($confirmation -eq 'y') {

#             .("./config.ps1")

#         }
#     }
# }

function Ensure-Path-Exists {
    $UserPath = ".\temp"

    If (!(test-path $UserPath)) {

        New-Item -ItemType Directory -Force -Path $UserPath

    }
}

function Ensure-Script-Exists {

    param(
        [string]$Script,
        [string[]]$AvailableScripts
    )

    $ScriptExists = $AvailableScripts.Contains("$Script.ps1")  

    if (

        -not($ScriptExists)

    ) {

        Write-Warning "The script $Script doesn't exist.`n "

        Script-List -AvailableScripts $AvailableScripts

        foreach ($ScriptFile in $ScriptFiles) {

            Write-Host "$ScriptFile"

        }
    
        exit 1
    }

}

function Normalize-Script-Name {

    param(

        [string]$Script

    )
    if (

        $Script -match '.ps1'

    ) {
 
        $Script = $Script -replace '\.ps1$', ""
    }
    return $Script
}

function Script-List {

    param(

        [string[]]$AvailableScripts

    )

    $ScriptsList = $AvailableScripts -join "`n"

    Write-Host "This is the list of available scripts:`n$ScriptsList"
}