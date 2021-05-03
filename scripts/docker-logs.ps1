#Check if the Docker uid exists
Ensure-Docker-Uid

$dockeruid = Get-Content -Path ./temp/dockeruid

& "docker" "logs" $dockeruid