##Ejercicio 1 - Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 2.0.

PASOS
1.- Instalar LXC 
>
>> sudo apt-get install lxc

2.- Verificamos 
>
>> lxc -checkconfig

##Ejercicio 2 - Instalar una distro tal como Alpine y conectarse a ella usando el nombre de usuario y clave que indicará en su creación

1.- Verficamos las plantillas
>
>> ls /usr/share/lxc/templates

2.- Arrancar contenedor 
>
>> lxc-start -n ubuntu-lxc -d 

3.-Conectarse a la consola
>
>> sudo lxc-console -n ubuntu-lxc


##Ejercicio 3 - Provisionar un contenedor LXC usando Ansible o alguna otra herramienta de configuración que ya se haya usado



##Ejercicio 4 - Buscar alguna demo interesante de Docker y ejecutarla localmente, o en su defecto, ejecutar la imagen anterior y ver cómo funciona y los procesos que se llevan a cabo la primera vez que se ejecuta y las siguientes ocasiones.

##Ejercicio 5 - Comparar el tamaño de las imágenes de diferentes sistemas operativos base, Fedora, CentOS y Alpine, por ejemplo.

##Ejercicio 6 - Crear a partir del contenedor anterior una imagen persistente con commit.

##Ejercicio 7 - 
