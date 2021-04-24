#Verifica se un file dockeruid esiste dentro temp

#Se non esiste printa error non ci sono container avviati

#Se esiste prendi l'uid nel file e vedi se il container sta andando

#Se sta andando chiudi "Container avviato"

#Se non sta andando avvialo salva l'uid e chiama docker-logs

$dockeruid = & "docker" "run" "--detach" "--publish" "10443:443" "nimmis/vcsim" "--vcenter" "-c" "3" "--data-stores" "10" "--hosts" "6" "--virtual-machines" "35"

$dockeruid | Out-File ./temp/dockeruid




