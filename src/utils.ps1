function Ensure-Server-Set {
    if (
        -not($Server)
    ) {
        Write-Warning "-server is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
        
        exit 1

    }
}
function Ensure-Cluster-Set {
    if (
        -not($Cluster)
    ) {

        Write-Warning "-cluster is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
        
        exit 1
    }
}

function Get-Credentials-Connect {

    $Credential = Import-Clixml -Path .\temp\ucred-secure.cred

    Connect-VIServer -Server $Server -Credential $Credential

}

function Ensure-Config-Exists {

    If (!(test-path .\temp\ucred-secure.cred)) {
        $Confirmation = Read-Host "Would you like to run the configuration file now? (y/n)"

        if ($Confirmation -eq 'y') {

            .(".\src\config.ps1")

        }
        else {

            Exit 1

        }
    }
}

function Ensure-Path-Exists {

    $UserPath = ".\temp"

    If (!(test-path $UserPath)) {

        New-Item -ItemType Directory -Force -Path $UserPath

    }
}
function Available-Scripts {

    #Filters all the scripts inside ./scripts that contains .ps1
    return Get-ChildItem "./scripts" -Name -Filter *.ps1

}

function Script-List {
    param(
        [string[]]$Scripts
    )

    $ScriptsList = $Scripts -join "`n"
    
    Write-Host "This is the list of available scripts:`n$ScriptsList`n"
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

        Write-Warning "The script $Script doesn't exist.`n"

        Script-List -Scripts $AvailableScripts

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

# function Ensure-Docker-Installed {

# }

# function Docker-Start-Settings {

# }