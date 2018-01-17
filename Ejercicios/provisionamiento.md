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



## Ejercicio 5 - Desplegar los fuentes de una aplicación cualquiera, propia o libre, que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.
## Ejercicio 6 - Desplegar la aplicación que se haya usado anteriormente con todos los módulos necesarios usando un playbook de Ansible.
