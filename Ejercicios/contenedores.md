## Ejercicio 1 - Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 2.0.

PASOS

1.- Instalar LXC 
>
>> sudo apt-get install lxc

2.- Verificamos 
>
>> lxc -checkconfig

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/contenedor.PNG "ansible")

## Ejercicio 2 - Instalar una distro tal como Alpine y conectarse a ella usando el nombre de usuario y clave que indicará en su creación

1.- Verficamos las plantillas
>
>> ls /usr/share/lxc/templates

2.- Arrancar contenedor 
>
>> lxc-start -n ubuntu-lxc -d 

3.-Conectarse a la consola
>
>> sudo lxc-console -n ubuntu-lxc

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/contenedor1.PNG "ansible")

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/contenedor2.PNG "ansible")





