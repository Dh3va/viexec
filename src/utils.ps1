#This function is used in every script, it ensures that the field server is specified. 
function Ensure-Server-Set {

    if (
        -not($Server)
    ) {
        Throw "`nServer is required: ./viexec 'script-name' 'server-name' 'cluster-name'`n"
        
    }
}

#This function is used in every script that requires the field cluster. 
function Ensure-Cluster-Set {

    if (
        -not($Cluster)
    ) {

        Throw "`nCluster is required: ./viexec 'script-name' 'server-name' 'cluster-name'`n"

    }
}

#Prompt user for credentials then stores them in a secure file under the './temp' folder.
function Get-Credentials-Connect {

    $Credential = Import-Clixml -Path .\temp\ucred-secure.cred

    Connect-VIServer -Server $Server -Credential $Credential | Tee-Object -Variable Connect

    $Connect.Count
}

#This function checks if the file ucred-secure exists, if it doesn't, will ask the user if he wants to run the configuration script.
function Ensure-Config-Exists {

    If (!(Test-Path .\temp\ucred-secure.cred)) {

        $Confirmation = Read-Host "Would you like to run the configuration file now? (y/n)"

        if ($Confirmation -Eq 'y') {

            .(".\src\config.ps1")

        }
        elseif ($Confirmation -Eq 'n') {

            Exit 1

        }
    }
}

#Check if the file ucre-secure.cred exists
function Ensure-Replace {

    $CredPath = Test-Path -Path .\temp\ucred-secure.cred

    If ($CredPath -Eq $True) {

        $Confirmation = Read-Host "You already store credentials, would you like to replace them? (y/n)"

        if ($Confirmation -Eq 'y') {
            #proceed
        }

        elseif ($Confirmation -Eq 'n') {

            Exit 1

        }
    }

    else {
        #proceed
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

#Ensures that dockeruid and the result of docker ps are not empty, and that the values of dockeruid and the docker ps are equal.
function Ensure-Docker-Uid {

    $Dockeruid = Get-Content -Path ./temp/dockeruid

    if (!$Dockeruid) {
        
        Write-Host "`nThere are no containers running.`n"

        Exit 1
    
    }
}

#Checks if dockerps contais dockeruid, if it does, the container is running, otherwise it starts the docker container.
function Ensure-Container {

    $Dockeruid = Get-Content -Path ./temp/dockeruid

    if ($Dockeruid -Ne "") {

        Write-Host "`nThe vCenter is already running, use localhost as server and DC0_0 as cluster, this is the UID: $Dockeruid`n"

        Exit 1
        
    }
    elseif (!$Dockeruid) {
        
        $Dockeruid = & "docker" "run" "--detach" "--publish" "443:443" "nimmis/vcsim" "-c" "3" "--data-stores" "10" "--hosts" "6" "--virtual-machines" "35" | Tee-Object -Variable DockerStart

        $DockerStart.Count

        $Dockeruid | Out-File ./temp/dockeruid

        Write-Host "`nThe vCenter has been started. Use localhost as a server and DC0_C0 as cluster.`n"

        Exit 0
    
    }
}

function Stop-Container {
      
    $Dockeruid = Get-Content -Path ./temp/dockeruid

    if ($Dockeruid -Ne "") {

        & "docker" "stop" $Dockeruid
        
        Write-Host "`nThe container: $Dockeruid`nHas been stopped.`n"

        $Dockeruid = ""

        $Dockeruid | Out-File ./temp/dockeruid

    }

    else {
        
        "`nThere are no containers running.`n"

        Exit 1

    }
    
}