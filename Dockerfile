FROM ubuntu
MAINTAINER Dayana Aguirre Iñiguez "daiaguirrei@correo.ugr.es"

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir apache
RUN cd apache
RUN echo "<h1>Prueba de funcionamiento contenedor docker</h1>">index.html

EXPOSE 80
ADD ["index.html","/var/www/html/"]

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
