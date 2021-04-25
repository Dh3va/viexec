#Verifica se un file dockeruid esiste dentro temp

#Se non esiste printa error non ci sono container avviati

#Se esiste prendi l'uid nel file e vedi se il container sta andando

#Se sta andando chiudi "Container avviato"

#Se non sta andando avvialo salva l'uid e chiama docker-logs

#This will start a container with a fully functional vCenter running with 3 cluster, 6 hosts, 10 datastores and 35 VMs.
$dockeruid = & "docker" "run" "--detach" "--publish" "443:443" "nimmis/vcsim" "-c" "3" "--data-stores" "10" "--hosts" "6" "--virtual-machines" "35"

#This saves the container uid in a file.
$dockeruid | Out-File ./temp/dockeruid




