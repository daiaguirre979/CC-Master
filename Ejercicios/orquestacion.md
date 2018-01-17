## Ejercicio 1 - Instalar una máquina virtual Debian usando Vagrant y conectar con ella
1. Instalar vagrant. Descargar el archivo [aqui](https://www.vagrantup.com/downloads.html)
>
>> dpkg -i vagrant_2.0.1_x86_64.deb 
2. Descargar sistema operativo a utilizar.
>
>>   vagrant box add debian/jessie64 https://app.vagrantup.com/debian/boxes/jessie64
>>
3.- Creamos nuestra mv y su repositorio 
>
>>    mkdir vagrant-ubuntu
>>    cd vagrant-ubuntu
>>
4.- vagrant init
5.- Editamos el archivo vim Vagrantfile
6.- vagrant up --provide=azure
7.- vagrant ssh

![Con titulo](https://github.com/daiaguirre979/CC-Master/blob/master/debian.PNG "orquestacion")

![Con titulo](https://github.com/daiaguirre979/CC-Master/blob/master/debian1.PNG "orquestacion")

## Ejercicio2 - Instalar una máquina virtual ArchLinux o FreeBSD para KVM, otro hipervisor libre, usando Vagrant y conectar con ella.

Realizamos los pasos anteriores, Solo con la diferencia que le indicamos que quiere trabajar con libvirt
>
>>   sudo vagrant up --provider=libvirt

![Con titulo](https://github.com/daiaguirre979/CC-Master/blob/master/archlinux.PNG "orquestacion")

## Ejercicio3 - Crear un script para provisionar de forma básica una máquina virtual para el proyecto que se esté llevando a cabo en la asignatura.

>
>> #!/bin/bash
>>
>> echo Creando maquina virtual - vmk
>> az group create --name CCdaivmk1 --location westus
>> ip=$(az vm create --resource-group CCdaivmk1 --name HitoCC1 --image UbuntuLTS --generate-ssh-keys | jq -r '.publicIpAddress')
>> echo -ip: $ip
>> ansible-playbook -i "$ip," webserver.yml -u dayanna
>>

## Ejercicio 4 - Configurar tu máquina virtual usando vagrant con el provisionador ansible

1. Instalar vagrant. Descargar el archivo [aqui](https://www.vagrantup.com/downloads.html)
>
>> dpkg -i vagrant_2.0.1_x86_64.deb 

2. Descargar sistema operativo a utilizar.
>
>>  vagrant box add azure https://github.com/azure/vagrant-azure/raw/v2.0/dummy.box --provider azure
>>

3. Creamos nuestra mv y su repositorio 
>
>>    mkdir vagrant-ubuntu
>>    cd vagrant-ubuntu
>>

4. Instalamos Azure CLI. Pasos [aqui](https://github.com/daiaguirre979/ProyectoMasterCC/tree/master/automatizacion)

5. Login en azure 
>
>> az login

6. Creamos una cuenta en azure active directory con acceso azure resource manager 
>
>> az ad sp create-for-rbac

Nos devuelve la siguiente informacion
>
>> {
>>  "appId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
>>  "displayName": "some-display-name",
>>  "name": "http://azure-cli-2017-04-03-15-30-52",
>>  "password": "XXXXXXXXXXXXXXXXXXXX",
>>  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
>> }

7. Creamos el archivo de configuración y lo modificamos segun uestras preferencias.
>
>>   vagrant init
>>   Archivo de configuración: Vagrantfile

8. Instalamos plugin de vagrant-azure
>
>> vagrant plugin install vagrant-azure

9. Iniciamos la mv

>
>>  vagrant up --provider=azure
>>

![Con titulo](https://github.com/daiaguirre979/CC-Master/blob/master/1-orq.png "orquestacion")

![Con titulo](https://github.com/daiaguirre979/CC-Master/blob/master/3-orq.png "orquestacion")


