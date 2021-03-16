function Ensure-Server-Set {
    if(
    -not($server)
)
{
    Write-Warning "-server is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
    exit 1

    $available_servers = Get-Content -Path .\ServerList\serverlist.txt

    Write-Host "$available_servers"

}
}
function Ensure-Cluster-Set {
    if(
    -not($cluster)
)
{
    Write-Warning "-cluster is required: ./viexec -server <server> -cluster <cluster> -script <script>`n"
    exit 1
}
}

function Normalize-Script-Name {
    if(
    $script -match '.ps1'
) 
{
    $script = $script -replace '\.ps1$', ""
}
}

function Script-List {
    $scripts_list = $available_scripts -join "`n"

Write-Host "This is the list of available scripts:`n$scripts_list"
}