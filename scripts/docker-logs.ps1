#Check if the Docker uid
Ensure-Docker-Uid

$dockeruid = Get-Content -Path ./temp/dockeruid

& "docker" "logs" $dockeruid