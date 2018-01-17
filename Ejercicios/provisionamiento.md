## Ejercicio 1 - Instalar chef-solo en la máquina virtual que vayamos a usar

Paso 1 - Instalar dependencias
>
>> * apt-get install curl
>> * curl -L https://www.opscode.com/chef/install.sh | bash 

Confirmar su instalación
>
>> chef-solo -v 

![Con titulo](https://raw.githubusercontent.com/daiaguirre979/CC-Master/master/chef-solo.PNG "automatizacion")

## Ejercicio 2 - Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

1.- Creamos la ruta donde estara nuestras recetas.
>
>> mkdir /chef/cookbooks/nginx/recipes

2.- Creamos nuestra receta con el nombre default.rb
>
>> package 'nginx'
>> execute "apt-get install nginx" do
>>    command "sudo apt-get install nginx"
>> end
>>package 'emacs'
>>  directory '/home/ubuntu/Documentos'
>>  file "/home/ubuntu/Documentos/Prueba" do
>>      owner "ubuntu"
>>      group "ubuntu"
>>      mode 00544
>>      action:create
>>      content: "Ejercico chef-solo"
>> end

3.- Creamos un archivo de configuraciones
>
>> file_cache_path "/home/ubuntu/chef"
>> cookbook_path "/home/ubuntu/chef/cookbooks"
>> json_atrribs "/home/ubuntu/chef/node.json"

4.- Archivo json incluyendo la receta de la referencia
>
>> {"run_list":["recipe[nginx]"]}

5.- Ejecutamos 
>
>> sudo chef-solo -c solo.rb

![Con titulo](https://raw.githubusercontent.com/daiaguirre979/CC-Master/master/chef-soolo.PNG "automatizacion")

## Ejercicio 3 - Escribir en YAML la siguiente estructura de datos en JSON
>
>>{ uno: "dos",
>>  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

>
>> uno: dos
>> tres:
>> 4
>> 5
>> Seis
>> siete: 8
>> nueve:
>> 10
>> 11


## Ejercicio 4 -Provisionar una máquina virtual en algún entorno con los que trabajemos habitualmente usando Salt.

1.- Instalando Salt
>
>> sudo apt-get install python-software-properties
>> sudo add-apt-repository ppa:saltstack/salt
>> sudo apt-get update
>> sudo apt-get install salt-minion
>> sudo apt-get install salt-master

2.- Modificamos el archivo de configuración indicandole la ip a utilizar
>
>> vim /etc/salt/minion

3.- Reiniciamos el servicio 
>
>> service salt-minion restart

4.- Asignamos una clave
>
>> salt-key -a '$pass'

5.- Instalamos nginx
>
>> salt '$pass' pkg.install nginx
![Con titulo](https://raw.githubusercontent.com/daiaguirre979/CC-Master/master/salr.PNG "automatizacion")

## Ejercicio 5 y 6 - Desplegar los fuentes de una aplicación cualquiera, propia o libre, que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

1. Actualizar la versión 
* sudo apt-get 

2. Instalar paquetes necesarios.

>
>>   * sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
>>

3. Instalar Azure Cli 

>
>>   * curl -L https://aka.ms/InstallAzureCli | bash
>>   * exec -l %SHELL
>>   * az --version

4. Conectarse a Azure Cli

>
>>   * az login
>>

5. Ejecutar el script acopio.sh, para crear maquina virtual desde Azure-Cli y a su vez utilizar el provisionamiento, para nuestro proyecto.

>
>>   * sh acopio.sh
>>
![Con titulo](https://raw.githubusercontent.com/daiaguirre979/CC-Master/master/automatizacion.png "automatizacion")






