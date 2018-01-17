
#!/bin/bash

#Creamos el grupo de recursos
echo Creando maquina virtual - vmk
az group create --name CCdaivmk1 --location westus

# Comando para crear maquina virtual 
ip=$(az vm create --resource-group CCdaivmk1 --name HitoCC1 --image UbuntuLTS --generate-ssh-keys | jq -r '.publicIpAddress')
echo -ip: $ip

# realizando el provisionamiento
ansible-playbook -i "$ip," webserver.yml -u dayanna
