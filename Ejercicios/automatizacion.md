## Ejercicio 1 - Crear una máquina virtual Ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

1.- Instalamos el servidor ngnix
> 
>> apt-get update
>> apt-get install nginx

2.- Probamos su funcionamiento 
>
>> systemctl status nginx

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/ngnix.PNG "ngnix")


## Ejercicio 2 - Crear una instancia de una máquina virtual Debian y provisionarla usando alguna de las aplicaciones vistas en el 
tema sobre herramientas de aprovisionamiento

Utilizare ansible
Pasos para su instalación

>
>> sudo apt-get update
>> sudo apt-get install python-pip python-dev git -y
>> sudo pip install PyYAML jinja2 paramiko
>> git clone https://github.com/ansible/ansible.git
>> cd ansible
>> sudo make install
>> sudo mkdir /etc/ansible
>> sudo cp ~/ansible/examples/hosts /etc/ansible/

Modificamos el archivo de configuración
>
>> vim /etc/ansible/hosts

Comprobamos
>
>> ansible all -m ping -u root

Creamos el playbook

Ejecutamos
>
>> ansible-playbook playbook.yml

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/debianPR.PNG "ngnix")

## Ejercicio 3 - Conseguir una cuenta de prueba en OpenStack y crear una instancia a la que se pueda acceder, provisionándola con algún script disponible.
