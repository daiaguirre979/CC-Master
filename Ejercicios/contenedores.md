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


## Ejercicio 3 - Provisionar un contenedor LXC usando Ansible o alguna otra herramienta de configuración que ya se haya usado


Para la instalaccion de ansible.

>
>>	* sudo apt-get install software-properties-common
>>	* sudo apt-add-repository ppa:ansible/ansible
>>	* sudo apt-get install ansible


3. Modificar el archivo /etc/ansible/hosts donde indicaremos el o los nodos donde se ejecutaran las tareas automaticamente.

>
>>	[webserver]
>>	52.174.183.222


4. Como modo se seguridad vamos a crear un par de claves para la autenticacion ssh y finalizando verificamos su conexion.

>
>>	* ansible all -m ping -u root


5. Crear playbook, de las tareas necesarias.

~~~
- hosts: webservers
sudo: yes
 task:
 - name: General | Instalación de paquetes requeridos.
  action: apt pkg={{ item }} state=installed  with_items: - lxc 
  -name: General action: sudo lxc-create -n ubuntu-lxc -t ubuntu
~~~

6.- Finalmente ejecutamos el playbook

>
>>	* ansible-playbook webserver.yml

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/contenedor3.PNG "ansible")


## Ejercicio 4 - Buscar alguna demo interesante de Docker y ejecutarla localmente, o en su defecto, ejecutar la imagen anterior y ver cómo funciona y los procesos que se llevan a cabo la primera vez que se ejecuta y las siguientes ocasiones.


1. Instalación de Docker

>
>> * sudo apt-get update
>> * sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
>> * echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
>> * apt-cache policy docker-engine
>> * sudo apt-get install -y docker-engine
>>

2. Verificamos que el daemon este iniciado y configurado

>
>> * sudo systemctl status docker

3.- Como vereficación decargaremos la imagen hello-word de DockerHub

>
>> * docker run hello-word
![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/dockerR1.PNG "docker")

4.- BUscaremos otra imagen y la descargaremos para su uso , en este caso usaremos Centos

>
>> * docker search centos
>> * docker pull centos

5.- Ejecutamos el contenedor, utilizando -it para acceder al shell en el contendor.

>
>> * docker run -it centos

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/dockerR2.PNG "docker")



## Ejercicio 5 - Comparar el tamaño de las imágenes de diferentes sistemas operativos base, Fedora, CentOS y Alpine, por ejemplo.

Imagen mas tamaño es de Centos comparada con Alpine que se muy pequeña

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/dockerR2.PNG "docker")



## Ejercicio 6 - Crear a partir del contenedor anterior una imagen persistente con commit.

1.- Verificamos el estado del contenedor

>
>> * sudo docker ps -l

2.- Guardamos el estado del contendor usando -m para un mensaje y -a para especificar el autor. 

>
>> * docker commit -m "addnv" -a "daiaguirre" d9b100f2f636 ubuntu

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/dockerR4.PNG "docker")



## Ejercicio 7 - Examinar la estructura de capas que se forma al crear imágenes nuevas a partir de contenedores que se hayan estado ejecutando.


Para examinar las capas con el comando :

>
>> * jq '.' /var/lib/docker/image/aufs/imagedb/content/sha256/ab82cf739b6be958c17480abd5aa5c66828b483d28a033a76f66c5e6e06758ee

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/dockerR5.PNG "docker")


## Ejercicio 8 - Crear un volumen y usarlo, por ejemplo, para escribir la salida de un programa determinado.


Para crear un volumen

>
>>* sudo docker volume create benchmark
>>* sudo docker pull fedora
>>* sudo docker run -it --rm -v benchmark:/app fedora /bin/bash
>>* sudo docker run -it --rm -v benchmark:/app fedora sh /app/bm.sh    


Escribir una salida bmm.sh

~~~

#!/bin/bash
SUMA=0
for ELEMENTOS in `ls -l | grep ^- | sed "s:^\([^ ]*[ ]*\)\{4\}\([0-9]*\).*$:\2:g"`; do
SUMA=$[$SUMA+$ELEMENTOS]
done
echo  "la suma total es: $SUMA"
 
~~~

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/dockerR7.PNG "docker")



## Ejercicio 9 - Usar un miniframework REST para crear un servicio web y introducirlo en un contenedor, y componerlo con un cliente REST que sea el que finalmente se ejecuta y sirve como “frontend”.

1. Instalar docker-compose

>
>> sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose


contenedor, y componerlo con un cliente REST que sea el que finalmente se ejecuta y sirve como “frontend”.

Para su instalación se requiere instalar

>
>> * apt-get install -y python-pip
>> * pip install flask
>> * pip install SQLAlchemy
>> * pip install  Flask-SQLAlchemy

Adiccional creamos es servicio web servico.py

~~~
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/productos.db'
db = SQLAlchemy(app)
lass Productos(db.Model):
   id = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(96), unique=True)
   descripcion = db.Column(db.String(200), unique=True)
   valor = db.Column(db.String(20),unique=True)
@app.route("/")
def server_info():
return jsonify({"server": "Api Rest - Productos"})
 @app.route("/status/")
def server_status():return jsonify({"status": "OK" })
@app.route("/productos/", endpoint="nueva_productos", methods=["POST"])
def new_producto():
   from flask import request
   json = request.get_json()   
   name = json.get("name")
    descripcion = json.get("descripcion")
    valor = json.get("valor")
    new_prod = Productos()
   new_prod.name = name
    new_prod.descripcion = descripcion
    new_prod.valor = valor
    db.session.add(new_prod)
   db.session.commit()
 return jsonify({"id": new_prod.id}), 201
@app.route("/lista/", endpoint="lista_productos", methods=["GET"])
def lista_productos():
pruebas = Productos.query.order_by(Productos.id).all()
return jsonify({"productos": [{"id": x.id, "name": x.name, "descripcion": x.descripcion, "valor": x.valor} for x in pruebas] })
 if __name__ == "__main__":
 db.create_all() app.run(port=5000, host="0.0.0.0")
~~~

Ejecutamos el servcio web

>
>> * FLASK_APP=service.py flask run
>> * curl -XGET -H "Content-type: application/json" 'http://0.0.0.0:3000/lista/'
>> * curl -XPOST -H "Content-type: application/json" \    -d '{"name":"PARACETAMOL", "descripcion": "Analgesico", "valor":"$5"}' \     'http://0.0.0.0:3000/productos/'

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/dockerR6.PNG "docker")
![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/servicio.PNG "docker")



----- faltaa docker-compose

## Ejercicio 10 - Reproducir los contenedores creados anteriormente usando un Dockerfile.


Utilizando el servicio web del ejercicio anterior creamos un dockerfile.

~~~

FROM ubuntu:14.04
MAINTAINER Dayana <dayanna Aguirre>
WORKDIR /tmp
RUN apt-get update -y
RUN apt-get install -y python-pip
RUN pip install Flask
RUN pip install SQLAlchemy
RUN pip install Flask-SQLAlchemy
ENTRYPOINT ["python"]
CMD ["server.py"]

~~~

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/servicio1.PNG "docker")

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/servicio2.PNG "docker")

## Ejercico 11 - Crear con docker-machine una máquina virtual local que permita desplegar contenedores y ejecutar en él contenedores creados con antelación.

Pasos

1. Descargamos docker machine
~~~
curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
chmod +x /tmp/docker-machine && \
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
~~~

2. Verificamos su instalación

>
>> * docker-machine version

3. Creamos la maquina

>
>> * sudo docker-machine create --driver=virtualbox machine

![Con titulo](https://github.com/daiaguirre979/CC-Master/raw/master/machine.PNG "docker")



