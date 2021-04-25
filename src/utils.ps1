#This function is used in every script, it ensures that the field server is specified. 
function Ensure-Server-Set {
    if (
        -not($Server)
    ) {
        Write-Warning "-server is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
        
        exit 1

    }
}

#This function is used in every script that requires the field cluster. 
function Ensure-Cluster-Set {
    if (
        -not($Cluster)
    ) {

        Write-Warning "-cluster is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
        
        exit 1
    }
}


#Prompt user for credentials then stores them in a secure file under the './temp' folder.
function Get-Credentials-Connect {

    $Credential = Import-Clixml -Path .\temp\ucred-secure.cred

    Connect-VIServer -Server $Server -Credential $Credential

}

#This function checks if the file ucred-secure exists, if it doesn't, will ask the user if he wants to run the configuration script.
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

#Checks if the folder './temp' exists, if it doesn't, it will be created automatically.
function Ensure-Path-Exists {

    $UserPath = "./temp"

    If (!(test-path $UserPath)) {

        New-Item -ItemType Directory -Force -Path $UserPath

    }
}

#Filters all the scripts inside './scripts' that contains '.ps1'.
function Available-Scripts {

    return Get-ChildItem "./scripts" -Name -Filter *.ps1

}

#Lists all the available scripts.
function Script-List {
    param(
        [string[]]$Scripts
    )

    $ScriptsList = $Scripts -join "`n"
    
    Write-Host "This is the list of available scripts:`n$ScriptsList`n"
}

#Checks if the script typed by the user exists, if it doesn't, will list all the available scripts.
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

#Normalize the script name removing the '.ps1' extension if the user types it.  
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